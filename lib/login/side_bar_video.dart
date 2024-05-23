import 'dart:io';
import 'package:core/helpers/core_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

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
