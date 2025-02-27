import 'package:flutter/material.dart';
import 'package:mine/config/color/colors.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? childWidget;
  final String? enums;
  const CustomAppBar({super.key, this.childWidget, this.enums});

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
      ),
    );
  }
}
