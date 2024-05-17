import 'package:core/helpers/core_helpers.dart';
import 'package:core/widgets/core_button.dart';
import 'package:core/widgets/core_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final respo = RespoHelper.isDesktop(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          if (respo) const SideBarVideo(),
          Expanded(
            flex: 2,
            child: Container(
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
                                    // context.goNamed(RoutePathCore.todo.name);
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
                                    onTap: () {},
                                    text: 'Login',
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
          ),
        ],
      ),
    );
  }
}

class SideBarVideo extends StatefulWidget {
  const SideBarVideo({Key? key}) : super(key: key);

  @override
  _SideBarVideoState createState() => _SideBarVideoState();
}

class _SideBarVideoState extends State<SideBarVideo> {
  final videoUrl = "https://youtu.be/m9coOXt5nuw?si=1TNnLqng0q6_t9o1";
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: YoutubePlayer(
          controller: _youtubePlayerController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          onReady: () {
            _youtubePlayerController.play();
          },
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.red,
              ),
            ),
            PlaybackSpeedButton(),
            RemainingDuration(),
            FullScreenButton(),
          ],
        ),
      ),
    );
  }
}
