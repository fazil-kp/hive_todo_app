import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mine/config/color/colors.dart';
import 'package:mine/config/color/main_color_list.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateRangePickerDialog extends StatelessWidget {
  final Function(dynamic) onDateRangeSelected;
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final DateRangePickerSelectionMode range;

  const CustomDateRangePickerDialog({
    super.key,
    required this.onDateRangeSelected,
    required this.initialStartDate,
    required this.initialEndDate,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 420,
        height: 420,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: whiteColor,
        ),
        child: SfDateRangePicker(
          headerStyle: const DateRangePickerHeaderStyle(
            backgroundColor: transparentColor,
            textAlign: TextAlign.left,
            textStyle: TextStyle(fontSize: 20, color: blackColor),
          ),
          headerHeight: 60,
          backgroundColor: transparentColor,
          view: DateRangePickerView.month,
          monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {},
          onSubmit: (Object? value) {
            if (value is DateTime && range == DateRangePickerSelectionMode.single) {
              onDateRangeSelected(value);
            } else if (value is PickerDateRange && range == DateRangePickerSelectionMode.range) {
              onDateRangeSelected([value.startDate, value.endDate]);
            }
            Navigator.pop(context);
          },
          onCancel: () {
            Navigator.pop(context);
          },
          showActionButtons: true,
          selectionMode: range,
          initialSelectedRange: PickerDateRange(initialStartDate, initialEndDate),
        ),
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  final dynamic value;
  final String label;
  final bool? isRangePicker;
  final dynamic onDateChanged;
  final double width;
  final double? height;
  final bool readOnly;

  const DatePicker({
    super.key,
    required this.label,
    this.value,
    this.isRangePicker,
    required this.onDateChanged,
    this.width = 150,
    this.height,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: readOnly ? null : () => _showDatePicker(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " $label",
            style: TextStyle(fontSize: 10, color: context.mainColors.ashGrey),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 0.5, color: context.mainColors.ashGrey!),
            ),
            width: width,
            height: height ?? 46,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _formatDisplayValue(value),
                    style: TextStyle(fontSize: 16, color: context.mainColors.ashGrey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(CupertinoIcons.calendar, color: context.mainColors.ashGrey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDisplayValue(dynamic value) {
    if (value == null) {
      return '';
    } else if (value is DateTime) {
      if (isRangePicker == null || isRangePicker == false) {
        return '${value.day}/${value.month}/${value.year}';
      } else {
        return '${value.day}/${value.month}/${value.year} - ${value.day}/${value.month}/${value.year}';
      }
    } else if (value is List<DateTime?> && value.length == 2) {
      var start = value[0];
      var end = value[1];
      if (start != null && end != null) {
        return '${start.day}/${start.month}/${start.year} - ${end.day}/${end.month}/${end.year}';
      }
    }
    return '';
  }

  void _showDatePicker(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDateRangePickerDialog(
          initialStartDate: value is DateTime ? value : DateTime.now(),
          initialEndDate: value is List<DateTime?> && value.length == 2 && value[1] != null ? value[1]! : DateTime.now(),
          onDateRangeSelected: (dynamic value) {
            onDateChanged(value);
          },
          range: isRangePicker ?? false ? DateRangePickerSelectionMode.range : DateRangePickerSelectionMode.single,
        );
      },
    );
  }
}
