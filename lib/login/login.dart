import 'package:core/helpers/core_helpers.dart';
import 'package:core/widgets/core_button.dart';
import 'package:core/widgets/core_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final respo = RespoHelper.isDesktop(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,






      
      body: Row(
        children: [
          const AssetPlayerWidget(),
          30.width,
          Container(
            decoration: respo ? null : BoxDecoration(color: blackColor.withOpacity(.9), image: const DecorationImage(image: AssetImage("assets/images/testimg3.jpg"), fit: BoxFit.cover, opacity: .3)),
            child: Padding(
              padding: EdgeInsets.all(respo ? 20 : 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: respo ? 0 : 80,
                    color: respo ? transparentColor : whiteColor.withOpacity(.2),
                    child: SizedBox(
                      height: respo ? 400 : 400,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
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
                                onEditingComplete: () async {
                                },
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
                        ),
                      ),
                    ),
                  ),
                  10.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AssetPlayerWidget extends StatefulWidget {
  const AssetPlayerWidget({super.key});

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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: context.width() * 0.5,
        height: context.height() * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: VideoPlayerWidget(controller: controller),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? VideoPlayer(controller)
      : const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
}
