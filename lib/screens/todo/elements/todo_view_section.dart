import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:mine/config/color/colors.dart';
import 'package:mine/extension/integer_extension.dart';
import 'package:mine/plugin/custom_text_field.dart';
import 'package:project/helper/date_enum.dart';
import 'package:project/helper/main_widget.dart';
import 'package:project/helper/table.dart';
import 'package:project/view_model/todo_vm.dart';
import 'package:provider/provider.dart';

class TodoViewSection extends StatelessWidget {
  const TodoViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoVm>(builder: (context, vm, _) {
      return MainWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: "Search",
              prefix: Icon(Icons.search, color: blackColor.withOpacity(.5)),
              value: vm.searchFilter,
              onChanged: (val) {
                vm.search(val);
              },
            ),
            20.height,
            CustomDataTable(
              columns: const [
                DataColumn2(label: Text('id')),
                DataColumn2(label: Text('Name')),
                DataColumn2(label: Text('Phone')),
                DataColumn2(label: Text('Address')),
                DataColumn2(label: Text('Email')),
                DataColumn2(label: Text('Gender')),
                DataColumn2(label: Text('Date of Birth')),
                DataColumn2(label: Text('Date of Joining')),
              ],
              rows: [
                ...vm.studentModelList.data.map(
                  (e) {
                    return DataRow2(
                      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                        }
                        if (e.id == vm.studentModel.id) {
                          return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                        }
                        return null;
                      }),
                      specificRowHeight: 50,
                      selected: e.id == vm.studentModel.id,
                      onTap: () {
                        vm.studentModel = e;
                        vm.refresh();
                      },
                      cells: [
                        DataCell(Text(e.id.toString())),
                        DataCell(Text(e.name ?? '')),
                        DataCell(Text(e.phone == null ? '' : e.phone.toString())),
                        DataCell(Text(e.address ?? '')),
                        DataCell(Text(e.email ?? '')),
                        DataCell(Text(e.gender ?? '')),
                        DataCell(Text(e.dob.parseString(DateType.dmy))),
                        DataCell(Text(e.duration?.parseList(DateType.dmy) ?? '')),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
