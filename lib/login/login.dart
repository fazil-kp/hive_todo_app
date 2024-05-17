import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AssetPlayerWidget(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 400,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AssetPlayerWidget extends StatefulWidget {
  const AssetPlayerWidget({Key? key}) : super(key: key);

  @override
  _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  final asset = 'assets/videos/loginvideo.mp4';
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: SizedBox(
        height: context.height() * 0.65,
        width: context.width() * 0.65,
        child: VideoPlayerWidget(controller: controller),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? buildVideo()
      : SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
        ],
      );

  Widget buildVideoPlayer() => VideoPlayer(controller);
}
