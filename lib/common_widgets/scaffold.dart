import 'package:flutter/material.dart';
import 'package:mine/config/color/colors.dart';
import '../screens/todo/student_screen.dart';
import 'app_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? childWidget;
  final String? enums;
  final bool? hideScaffold;
  const CustomScaffold({super.key, this.childWidget, this.enums, this.hideScaffold = false});

  @override
  Widget build(BuildContext context) {
    return hideScaffold == false
        ? Scaffold(
            backgroundColor: whiteColor,
            body: Column(
              children: [
                CustomAppBar(enums: enums, childWidget: childWidget),
                Expanded(child: childWidget ?? const TodoScreen()),
              ],
            ),
          )
        : Scaffold(body: childWidget);
  }
}
