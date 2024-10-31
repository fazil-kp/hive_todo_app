import 'package:flutter/material.dart';
import 'package:mine/helpers/color/main_color_list.dart';
import 'package:nb_utils/nb_utils.dart';

class MainWidget extends StatelessWidget {
  final double? mainheight;
  final double? subheight;
  final double? mainwidth;
  final double? subwidth;
  final Widget child;
  const MainWidget({super.key, required this.child, this.mainheight, this.mainwidth, this.subheight, this.subwidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: context.mainColors.ashGrey!), color: whiteColor, boxShadow: defaultBoxShadow()),
          width: mainwidth ?? MediaQuery.of(context).size.width - 500,
          height: mainheight ?? MediaQuery.of(context).size.height - 200,
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: subwidth ?? 400,
            height: subheight ?? MediaQuery.of(context).size.height - 205,
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
