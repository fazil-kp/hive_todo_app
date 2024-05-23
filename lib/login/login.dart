import 'package:flutter/material.dart';
import 'login_form.dart';
import 'side_bar_video.dart';

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
