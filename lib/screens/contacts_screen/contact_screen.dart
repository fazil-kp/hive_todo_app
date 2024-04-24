import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/screens/contacts_screen/contact_add.dart';
import 'package:project/screens/contacts_screen/contacts_view.dart';

import '../../view_model/riverpod.dart';

class ContactScreenScreen extends ConsumerWidget {
  const ContactScreenScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const ContactAdd(),
              20.width,
              const ContactsViewTable(),
            ],
          ),
          20.height,
          ElevatedButton(
            onPressed: () {
              context.goNamed("employee");
            },
            child: const Text("Go"),
          ).center(),
          20.height,
          ElevatedButton(
            onPressed: () {
              ref.watch(contactVM).getContact();
              ref.watch(contactVM).refresh();
            },
            child: const Text("Api get check"),
          ).center()
        ],
      ),
    );
  }
}
