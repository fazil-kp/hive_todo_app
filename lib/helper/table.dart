import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:project/helper/sub_widget.dart';

class CustomDataTable extends StatelessWidget {
  final double? height;
  final List<DataColumn2> columns;
  final List<DataRow2> rows;
  const CustomDataTable({super.key, required this.columns, required this.rows, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubWidget(
          child: DataTable2(
            empty: Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 16))),
            columnSpacing: 0,
            columns: columns,
            rows: rows,
          ),
        ),
      ],
    );
  }
}
