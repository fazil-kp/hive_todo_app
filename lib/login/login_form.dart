import 'package:core/helpers/core_helpers.dart';
import 'package:core/widgets/core_button.dart';
import 'package:core/widgets/core_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

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
