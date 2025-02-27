import 'package:flutter/material.dart';
import 'package:mine/config/color/main_color_list.dart';
import 'package:nb_utils/nb_utils.dart';

class MainWidget extends StatelessWidget {
  final double? mainHeight;
  final double? subHeight;
  final double? mainWidth;
  final double? subWidth;
  final Widget child;
  const MainWidget({super.key, required this.child, this.mainHeight, this.mainWidth, this.subHeight, this.subWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: context.mainColors.ashGrey!), color: whiteColor, boxShadow: defaultBoxShadow()),
          width: mainWidth ?? MediaQuery.of(context).size.width - 500,
          height: mainHeight ?? MediaQuery.of(context).size.height - 200,
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: subWidth ?? 400,
            height: subHeight ?? MediaQuery.of(context).size.height - 205,
            child: Container(
              height: context.height() - 265,
              decoration: BoxDecoration(
                border: Border.all(color: context.mainColors.ashGrey!),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
