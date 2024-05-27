import 'package:core/constants/config/core_color_code.dart';
import 'package:core/widgets/core_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../view_model/riverpod.dart';

class ContactAdd extends ConsumerWidget {
  const ContactAdd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: ColorCode.colorList(context).borderAshColor!), color: ColorCode.colorList(context).whiteBlack, boxShadow: defaultBoxShadow()),
      width: 400,
      height: MediaQuery.of(context).size.height - 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: context.height() - 265,
            decoration: BoxDecoration(
              border: Border.all(color: ColorCode.colorList(context).borderAshColor!),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                20.height,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          ref.watch(contactVM).contactModel.id == null ? 'Add Contact' : 'Update Contact',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: ColorCode.colorList(context).blackWhite,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: .5,
                              ),
                        ),
                        3.height,
                        Text(
                          ref.watch(contactVM).contactModel.id == null ? 'Add Contact Details' : 'Update Contact Details',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: ColorCode.colorList(context).ashWhiteLabel,
                                fontSize: 12,
                              ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    if (ref.watch(contactVM).contactModel.id != null) ...[
                      InkWell(
                        onTap: () async {
                          ref.watch(contactVM).deleteContact(ref.watch(contactVM).contactModel.id ?? 0);
                          ref.watch(contactVM).clear();
                          ref.watch(contactVM).refresh();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorCode.colorList(context).redOpacityWhite!),
                          child: Icon(
                            Icons.delete,
                            size: 16,
                            color: ColorCode.colorList(context).primary,
                          ).center(),
                        ),
                      ),
                      10.width,
                    ],
                    InkWell(
                      onTap: () async {
                        ref.watch(contactVM).clear();
                        ref.watch(contactVM).refresh();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorCode.colorList(context).redOpacityWhite!),
                        child: Icon(
                          ref.watch(contactVM).contactModel.id == null ? Icons.close : Icons.arrow_left,
                          size: 16,
                          color: ColorCode.colorList(context).primary,
                        ).center(),
                      ),
                    ),
                  ],
                ),
                15.height,
                CustomTextField(
                  width: double.infinity,
                  hintText: 'Contact Name',
                  value: ref.watch(contactVM).contactModel.name,
                  onChanged: (val) {
                    ref.watch(contactVM).contactModel = ref.watch(contactVM).contactModel.copyWith(name: val);
                  },
                ),
                20.height,
                CustomTextField(
                  width: double.infinity,
                  hintText: 'Phone',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  value: ref.watch(contactVM).contactModel.phone,
                  onChanged: (val) {
                    ref.watch(contactVM).contactModel = ref.watch(contactVM).contactModel.copyWith(phone: val);
                  },
                ),
                20.height,
                20.height,
                CustomTextField(
                  width: double.infinity,
                  hintText: 'Email',
                  value: ref.watch(contactVM).contactModel.email,
                  onChanged: (val) {
                    ref.watch(contactVM).contactModel = ref.watch(contactVM).contactModel.copyWith(email: val);
                  },
                ),
                20.height,
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (ref.watch(contactVM).contactModel.id == null) {
                  ref.watch(contactVM).save();
                } else {
                  ref.watch(contactVM).updateContact(ref.watch(contactVM).contactModel.id ?? 0);
                }
                ref.watch(contactVM).clear();
                ref.watch(contactVM).refresh();
              },
              child: const Text('Add Contact')),
          // ValidatorButton(
          //   text: ref.watch(contactVM).contactModel.id == null ? "Add Student" : "Update Student",
          //   state: ref.watch(contactVM).vmStateModel.state ?? VmState.current,
          //   onTap: () async {
          //     if (ref.watch(contactVM).contactModel.id == null) {
          //       ref.watch(contactVM).save();
          //     } else {
          //       // ref.watch(contactVM).update(ref.watch(contactVM).contactModel.id ?? 0);
          //     }
          //     ref.watch(contactVM).clear();
          //     ref.watch(contactVM).refresh();
          //   },
          //   successMessage: ref.watch(contactVM).vmStateModel.message ?? '',
          //   warningMessage: ref.watch(contactVM).vmStateModel.message ?? '',
          //   deleteMessage: ref.watch(contactVM).vmStateModel.message ?? '',
          // ),
        ],
      ),
    );
  }
}
