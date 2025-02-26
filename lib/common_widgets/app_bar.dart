import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mine/helpers/color/main_color_list.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/view_model/student_vm.dart';


class CustomAppBar extends ConsumerWidget {
  final Widget? childWidget;
  final String? enums;
  const CustomAppBar({super.key, this.childWidget, this.enums});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SizedBox(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Todo App", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: blackColor, fontSize: 20)),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: context.mainColors.ashGrey!),
                  borderRadius: BorderRadius.circular(50),
                  color: whiteColor,
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(
                  ref.watch(studentVM).isLightTheme ? Icons.light_mode : Icons.dark_mode,
                  color: ref.watch(studentVM).isLightTheme ? blackColor : whiteColor,
                  size: 20,
                ).onTap(() {
                  ref.watch(studentVM).isLightTheme = !ref.watch(studentVM).isLightTheme;
                  ref.watch(studentVM).refresh();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
