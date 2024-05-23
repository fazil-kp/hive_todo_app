import 'dart:io';
import 'package:core/helpers/core_helpers.dart';
import 'package:core/widgets/core_button.dart';
import 'package:core/widgets/core_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          Expanded(flex: 2, child: SideBarVideo()),
          Expanded(flex: 2, child: LoginForm()),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final respo = RespoHelper.isDesktop(context);
    return Container(
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            width: respo ? 370 : double.infinity,
            hintText: "Email",
            height: respo ? 50 : 65,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
          ),
          40.height,
          CustomTextField(
            width: respo ? 370 : double.infinity,
            hintText: "Password",
            height: respo ? 50 : 65,
            onEditingComplete: () async {},
            suffix: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility_off),
              iconSize: 20,
            ),
          ),
          40.height,
          SizedBox(
            width: respo ? 370 : double.infinity,
            height: respo ? 50 : 65,
            child: CustomButton(
              text: "Login",
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
            ),
          ),
          15.height,
          Center(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: respo ? darkGrey : whiteColor.withOpacity(.7).withOpacity(.7), fontSize: 14, fontWeight: FontWeight.bold),
                children: [
                  const TextSpan(text: "Don't have an account? "),
                  TextSpan(
                    text: 'Contact Us',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideBarVideo extends StatefulWidget {
  const SideBarVideo({super.key});

  @override
  State<SideBarVideo> createState() => _SideBarVideoState();
}

class _SideBarVideoState extends State<SideBarVideo> {
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
          _controller?.setPlaybackSpeed(0.8);
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
    final double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight,
      child: _isControllerInitialized && _controller != null
          ? FittedBox(fit: BoxFit.cover, child: SizedBox(width: _controller!.value.size.width, height: _controller!.value.size.height, child: VideoPlayer(_controller!)))
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
