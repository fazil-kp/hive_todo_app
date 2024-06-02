import 'dart:io';

import 'package:core/constants/config/core_color_code.dart';
import 'package:core/constants/enums/common_enums.dart';
import 'package:core/helpers/core_helpers.dart';
import 'package:core/widgets/core_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class CustomAlertDialogE extends StatelessWidget {
  final String? title;
  final String? description;
  final Widget? content;
  final double? width;
  final double? height;
  final double? imageHeight;
  final String? firstButtonText;
  final String? secondButtonText;
  final String? image;
  final ButtonType? firstbuttonType;
  final ButtonType? secondbuttonType;
  final VoidCallback? firstButtonTap;
  final VoidCallback? secondButtonTap;
  final int? timerDelay;
  const CustomAlertDialogE({super.key, this.title, this.description, this.firstButtonTap, this.secondButtonTap, this.content, this.firstButtonText, this.secondButtonText, this.firstbuttonType = ButtonType.primary, this.secondbuttonType = ButtonType.secondary, this.width, this.height, this.image, this.imageHeight, this.timerDelay});

  @override
  Widget build(BuildContext context) {
    final respo = RespoHelper.isDesktop(context);
    final Future<bool> enableYesButton = Future.delayed(Duration(seconds: timerDelay ?? 10), () => true);

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      content: SizedBox(
        width: width ?? 430,
        height: height ?? (image != null ? 390 : 170),
        child: Column(
          children: [
            // if (image != null) ...[
            //   Container(
            //     decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)), color: whiteColor, image: DecorationImage(image: AssetImage(image ?? ''), fit: BoxFit.cover)),
            //     width: width ?? 430,
            //     height: imageHeight ?? 210,
            //   ),
            // ],
            const PopupVideo(),
            20.height,
            Column(
              children: [
                Text(title ?? '', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
                if (description != null) ...[
                  10.height,
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      description ?? '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 14, color: ColorCode.colorList(context).ashWhiteLabel),
                    ).center(),
                  ),
                ],
                if (content != null) ...[10.height, content ?? const SizedBox.shrink()],
                25.height,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      if (timerDelay != null)
                        FutureBuilder(
                            future: enableYesButton,
                            builder: (context, snapshot) {
                              return Stack(
                                children: [
                                  CustomButton(
                                    width: 190,
                                    height: 45,
                                    text: firstButtonText ?? "Yes",
                                    color: snapshot.data == true ? ColorCode.colorList(context).primary! : Colors.grey.withOpacity(.5),
                                    textColor: whiteColor,
                                    border: Border.all(color: transparentColor),
                                    borderRadius: BorderRadius.circular(14),
                                    onTap: () {
                                      if (snapshot.data == true) {
                                        Navigator.of(context).pop();
                                        firstButtonTap!();
                                      }
                                    },
                                  ),
                                  if (snapshot.data != true)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      left: 0,
                                      bottom: 0,
                                      child: Container(
                                          decoration: BoxDecoration(color: snapshot.data == true ? whiteColor : ColorCode.colorList(context).primary!, borderRadius: BorderRadius.circular(14)),
                                          width: respo
                                              ? width == null
                                                  ? MediaQuery.of(context).size.width * 0.13
                                                  : (width! - 150)
                                              : 100,
                                          height: 40,
                                          child: Center(
                                            child: TimerCountdown(
                                              enableDescriptions: false,
                                              timeTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
                                              format: CountDownTimerFormat.secondsOnly,
                                              endTime: DateTime.now().add(Duration(seconds: timerDelay ?? 10)),
                                            ),
                                          )),
                                    )
                                ],
                              );
                            }),
                      if (timerDelay == null)
                        CustomButton(
                          width: 190,
                          height: 45,
                          text: firstButtonText ?? "Yes",
                          color: firstbuttonType == ButtonType.primary
                              ? ColorCode.colorList(context).primary!
                              : firstbuttonType == ButtonType.secondary
                                  ? ColorCode.colorList(context).redOpacityWhite!
                                  : firstbuttonType == ButtonType.positive
                                      ? ColorCode.colorList(context).positiveGreen!
                                      : firstbuttonType == ButtonType.negative
                                          ? ColorCode.colorList(context).redOpacityWhite!
                                          : firstbuttonType == ButtonType.additional
                                              ? Colors.grey
                                              : firstbuttonType == ButtonType.warning
                                                  ? Colors.orange
                                                  : Colors.blue,
                          textColor: firstbuttonType == ButtonType.primary
                              ? Colors.white
                              : firstbuttonType == ButtonType.secondary
                                  ? ColorCode.colorList(context).primary!
                                  : firstbuttonType == ButtonType.positive
                                      ? Colors.white
                                      : firstbuttonType == ButtonType.negative
                                          ? Theme.of(context).colorScheme.primary
                                          : firstbuttonType == ButtonType.additional
                                              ? Colors.white
                                              : firstbuttonType == ButtonType.warning
                                                  ? Colors.white
                                                  : Colors.white,
                          border: Border.all(color: transparentColor),
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            Navigator.of(context).pop();
                            firstButtonTap!();
                          },
                        ),
                      15.width,
                      CustomButton(
                        width: 185,
                        height: 45,
                        text: secondButtonText ?? "Cancel",
                        color: secondbuttonType == ButtonType.primary
                            ? ColorCode.colorList(context).primary!
                            : secondbuttonType == ButtonType.secondary
                                ? ColorCode.colorList(context).redOpacityWhite!
                                : secondbuttonType == ButtonType.positive
                                    ? Theme.of(context).colorScheme.primary
                                    : secondbuttonType == ButtonType.negative
                                        ? Theme.of(context).colorScheme.primary.withOpacity(.2)
                                        : secondbuttonType == ButtonType.additional
                                            ? Colors.grey
                                            : secondbuttonType == ButtonType.warning
                                                ? Colors.orange
                                                : Colors.blue,
                        textColor: secondbuttonType == ButtonType.primary
                            ? Colors.white
                            : secondbuttonType == ButtonType.secondary
                                ? ColorCode.colorList(context).primary!
                                : secondbuttonType == ButtonType.positive
                                    ? Colors.white
                                    : secondbuttonType == ButtonType.negative
                                        ? Theme.of(context).colorScheme.primary
                                        : secondbuttonType == ButtonType.additional
                                            ? Colors.white
                                            : secondbuttonType == ButtonType.warning
                                                ? Colors.white
                                                : Colors.white,
                        border: Border.all(color: transparentColor),
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          Navigator.of(context).pop();
                          secondButtonTap!();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PopupVideo extends StatefulWidget {
  const PopupVideo({super.key});

  @override
  State<PopupVideo> createState() => _PopupVideoState();
}

class _PopupVideoState extends State<PopupVideo> {
  VideoPlayerController? _controller;
  bool _isControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = '${tempDir.path}/loginvideo_${DateTime.now().millisecondsSinceEpoch}.mp4';
      final ByteData data = await rootBundle.load('assets/videos/loginvideo.mp4');
      final List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      final File videoFile = await File(tempPath).writeAsBytes(bytes, flush: true);
      _controller = VideoPlayerController.file(videoFile)
        ..initialize().then((_) {
          _controller?.setVolume(0.0);
          _controller?.play();
          _controller?.setPlaybackSpeed(2.5);
          _controller?.setLooping(true);
          setState(() {
            _isControllerInitialized = true;
          });
        });
    } catch (e) {
      printx('Error initializing video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)), color: whiteColor),
      width: double.infinity,
      child: _isControllerInitialized && _controller != null
          ? Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)), color: whiteColor),
              child: VideoPlayer(_controller!),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
