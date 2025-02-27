import 'package:flutter/material.dart';
import 'package:mine/config/color/main_color_list.dart';
import 'package:nb_utils/nb_utils.dart';


class SubWidget extends StatelessWidget {
  final double? height;
  final Widget child;
  const SubWidget({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.mainColors.ashGrey!),
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
          ),
          height: height ?? MediaQuery.of(context).size.height - 320,
          child: child,
        ),
      ],
    );
  }
}