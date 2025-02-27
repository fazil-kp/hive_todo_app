import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'elements/todo_add_section.dart';
import 'elements/todo_view_section.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const TodoAddSection(),
              20.width,
              const TodoViewSection(),
            ],
          ),
        ],
      ),
    );
  }
}
