import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mine/config/color/colors.dart';
import 'package:mine/extension/context_extension.dart';
import 'package:mine/extension/integer_extension.dart';
import 'package:mine/extension/string_extension.dart';
import 'package:mine/extension/widget_extension.dart';
import 'package:mine/plugin/custom_date_picker.dart';
import 'package:mine/plugin/custom_drop_down.dart';
import 'package:mine/plugin/custom_text_field.dart';

import 'package:project/view_model/todo_vm.dart';
import 'package:provider/provider.dart';

class TodoAddSection extends StatelessWidget {
  const TodoAddSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoVm>(builder: (context, vm, _) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: grey), color: whiteColor),
        width: 400,
        height: MediaQuery.of(context).size.height - 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: context.height() - 265,
              decoration: BoxDecoration(
                border: Border.all(color: grey),
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
                      10.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            vm.studentModel.id == null ? 'Add Student' : 'Update Student',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: .5,
                                ),
                          ),
                          3.height,
                          Text(
                            vm.studentModel.id == null ? 'Add Student Details' : 'Update Student Details',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: grey,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      if (vm.studentModel.id != null) ...[
                        InkWell(
                          onTap: () async {
                            vm.delete(vm.studentModel.id ?? 0);
                            vm.clear();
                            vm.refresh();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: redColor.withOpacity(.5)),
                            child: const Icon(
                              Icons.delete,
                              size: 16,
                              color: redColor,
                            ).center(),
                          ),
                        ),
                        10.width,
                      ],
                      InkWell(
                        onTap: () async {
                          vm.clear();
                          vm.refresh();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: redColor.withOpacity(.5)),
                          child: Icon(
                            vm.studentModel.id == null ? Icons.close : Icons.arrow_left,
                            size: 16,
                            color: redColor,
                          ).center(),
                        ),
                      ),
                    ],
                  ),
                  15.height,
                  CustomTextField(
                    hintText: 'Student Name',
                    value: vm.studentModel.name,
                    onChanged: (val) {
                      vm.studentModel = vm.studentModel.copyWith(name: val);
                    },
                  ),
                  20.height,
                  CustomTextField(
                    hintText: 'Phone',
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    value: (vm.studentModel.phone ?? '').toString(),
                    onChanged: (val) {
                      vm.studentModel = vm.studentModel.copyWith(phone: val.toInt());
                    },
                  ),
                  20.height,
                  CustomTextField(
                    hintText: 'Address',
                    value: vm.studentModel.address,
                    onChanged: (val) {
                      vm.studentModel = vm.studentModel.copyWith(address: val);
                    },
                  ),
                  20.height,
                  CustomTextField(
                    hintText: 'Email',
                    value: vm.studentModel.email,
                    onChanged: (val) {
                      vm.studentModel = vm.studentModel.copyWith(email: val);
                    },
                  ),
                  20.height,
                  CustomDropDown(
                    onChanged: (val) {
                      vm.studentModel = vm.studentModel.copyWith(gender: val);
                    },
                    hintText: "Gender",
                    items: const ['Male', 'Female'],
                  ),
                  10.height,
                  CustomDatePicker(
                    label: 'Date of Birth',
                    width: double.infinity,
                    onDateChanged: (val) {
                      vm.studentModel = vm.studentModel.copyWith(dob: val);
                      vm.refresh();
                    },
                    value: vm.studentModel.dob ?? DateTime.now(),
                  ),
                  10.height,
                  CustomDatePicker(
                    label: 'Duration',
                    isRangePicker: true,
                    width: double.infinity,
                    onDateChanged: (val) {
                      vm.studentModel = vm.studentModel.copyWith(duration: val);
                      vm.refresh();
                    },
                    value: vm.studentModel.duration ?? DateTime.now(),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (vm.studentModel.id == null) {
                    vm.save();
                  } else {
                    vm.update(vm.studentModel.id ?? 0);
                  }
                  vm.clear();
                  await Future.delayed(const Duration(seconds: 1));
                  vm.refresh();
                },
                child: Text(
                  vm.studentModel.id == null ? "Add Student" : "Update Student",
                )),
          ],
        ),
      );
    });
  }
}
