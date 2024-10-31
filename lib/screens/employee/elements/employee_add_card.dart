
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mine/helpers/color/main_color_list.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/helper/date.dart';
import 'package:project/helper/drop_down.dart';
import 'package:project/helper/textfield.dart';

import '../../../view_model/riverpod.dart';

class EmployeeAddCard extends ConsumerWidget {
  const EmployeeAddCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color:context.mainColors.ashGrey!), color: whiteColor, boxShadow: defaultBoxShadow()),
      width: 400,
      height: MediaQuery.of(context).size.height - 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: context.height() - 265,
            decoration: BoxDecoration(
              border: Border.all(color:context.mainColors.ashGrey!),
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
                          ref.watch(studentVM).studentModel.id == null ? 'Add Employee' : 'Update Employee',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: blackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: .5,
                              ),
                        ),
                        3.height,
                        Text(
                          ref.watch(studentVM).studentModel.id == null ? 'Add Employee Details' : 'Update Employee Details',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: grey,
                                fontSize: 12,
                              ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    if (ref.watch(studentVM).studentModel.id != null) ...[
                      InkWell(
                        onTap: () async {
                          ref.read(studentVM).delete(ref.watch(studentVM).studentModel.id ?? 0);
                          await Future.delayed(const Duration(seconds: 1));
                          ref.read(studentVM).clear();
                          ref.read(studentVM).refresh();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.mainColors.secondary),
                          child: Icon(
                            Icons.delete,
                            size: 16,
                            color: context.mainColors.primary,
                          ).center(),
                        ),
                      ),
                      10.width,
                    ],
                    InkWell(
                      onTap: () async {
                        ref.read(studentVM).clear();
                        ref.read(studentVM).refresh();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.mainColors.secondary),
                        child: Icon(
                          ref.watch(studentVM).studentModel.id == null ? Icons.close : Icons.arrow_left,
                          size: 16,
                          color: context.mainColors.primary,
                        ).center(),
                      ),
                    ),
                  ],
                ),
                15.height,
                CustomTextField(
                  width: double.infinity,
                  hintText: 'Student Name',
                  value: ref.watch(studentVM).studentModel.name,
                  onChanged: (val) {
                    ref.read(studentVM).studentModel = ref.read(studentVM).studentModel.copyWith(name: val);
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
                  value: ref.watch(studentVM).studentModel.phone.toString() == 'null' ? '' : ref.watch(studentVM).studentModel.phone.toString(),
                  onChanged: (val) {
                    ref.read(studentVM).studentModel = ref.read(studentVM).studentModel.copyWith(phone: val.toInt());
                  },
                ),
                20.height,
                CustomTextField(
                  width: double.infinity,
                  hintText: 'Address',
                  value: ref.watch(studentVM).studentModel.address,
                  onChanged: (val) {
                    ref.read(studentVM).studentModel = ref.read(studentVM).studentModel.copyWith(address: val);
                  },
                ),
                20.height,
                CustomTextField(
                  width: double.infinity,
                  hintText: 'Email',
                  value: ref.watch(studentVM).studentModel.email,
                  onChanged: (val) {
                    ref.read(studentVM).studentModel = ref.read(studentVM).studentModel.copyWith(email: val);
                  },
                ),
                20.height,
                CustomDropDown(
                  width: 348,
                  onChanged: (val) {
                    ref.read(studentVM).studentModel = ref.read(studentVM).studentModel.copyWith(gender: val);
                  },
                  label: "Gender",
                  items: const ['Male', 'Female'],
                ),
                10.height,
                DatePicker(
                  label: 'Date of Birth',
                  width: double.infinity,
                  onDateChanged: (val) {
                    ref.read(studentVM).studentModel = ref.read(studentVM).studentModel.copyWith(dob: val);
                    ref.read(studentVM).refresh();
                  },
                  value: ref.watch(studentVM).studentModel.dob ?? DateTime.now(),
                ),
                10.height,
                DatePicker(
                  label: 'Duration',
                  isRangePicker: true,
                  width: double.infinity,
                  onDateChanged: (val) {
                    ref.read(studentVM).studentModel = ref.read(studentVM).studentModel.copyWith(duration: val);
                    ref.read(studentVM).refresh();
                  },
                  value: ref.watch(studentVM).studentModel.duration ?? DateTime.now(),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                if (ref.watch(studentVM).studentModel.id == null) {
                  ref.read(studentVM).save();
                } else {
                  ref.read(studentVM).update(ref.watch(studentVM).studentModel.id ?? 0);
                }
                ref.read(studentVM).clear();
                ref.read(studentVM).refresh();
              },
              child: Text(
                ref.watch(studentVM).studentModel.id == null ? "Add Student" : "Update Student",
              )),
        ],
      ),
    );
  }
}
