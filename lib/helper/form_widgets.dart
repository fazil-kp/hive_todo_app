// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomInputDecoration {
  static InputDecoration build2({
    required BuildContext context,
    required String label,
    Widget? prefixIcon,
    Widget? suffix,
    Widget? suffixicon,
    Widget? prefix,
    bool decoration = false,
    bool? isDense,
    String Function(String)? validator,
    bool? suffixCalc,
    String? suffixCalcLabal,
    void Function(bool?)? onChangedCheck,
    double? value,
    double? value2,
    bool suffixP = false,
    Widget? counter,
  }) {
    final String xx = suffixP ? "in Amt:" : "Include:";
    final String xx1 = suffixP ? "in %:" : "Exclude:";

    return InputDecoration(
      counter: suffixCalc != null
          ? Text(
              suffixCalc ? "$xx1 ${value?.toStringAsFixed(2)}" : "$xx ${value2?.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 12),
            )
          : counter,
      filled: true,
      counterStyle: Theme.of(context).textTheme.labelSmall,
      fillColor: Theme.of(context).colorScheme.background,
      labelStyle: Theme.of(context).textTheme.bodySmall,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      isDense: isDense ?? true,
      labelText: label,
      floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.background,
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
      ),
      prefixIcon: prefixIcon,
      errorText: validator != null ? validator('') : null,
      suffix: suffixCalc != null
          ? Column(
              children: [
                SizedBox(
                  width: 18,
                  height: 8,
                  child: FocusScope(
                    canRequestFocus: false,
                    child: Checkbox(
                      value: suffixCalc,
                      visualDensity: VisualDensity.compact,
                      onChanged: onChangedCheck,
                    ),
                  ),
                ),
                Text(
                  suffixCalcLabal ?? "",
                  style: const TextStyle(fontSize: 10),
                )
              ],
            )
          : suffix,
      prefix: prefix,
      suffixIcon: suffixicon,
    );
  }

  static InputDecoration build({required BuildContext context, required String label, Widget? prefixIcon, Widget? suffix, Widget? suffixicon, Widget? prefix, bool decoration = true, bool? isDense, String Function(String)? validator, bool? suffixCalc, String? suffixCalcLabal, void Function(bool?)? onChangedCheck, double? value, double? value2, bool suffixP = false, Color? labelColor, Widget? counter, InputBorder? enabledBorder, InputBorder? focusedBorder, EdgeInsetsGeometry? contentPadding}) {
    final String xx = suffixP ? "in Amt:" : "Include:";
    final String xx1 = suffixP ? "in %:" : "Exclude:";

    return InputDecoration(
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      // alignLabelWithHint: true,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      counter: suffixCalc != null
          ? Text(
              suffixCalc ? "$xx1 ${value?.toStringAsFixed(2)}" : "$xx ${value2?.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.start,
            )
          : counter,
      hintStyle: Theme.of(context).textTheme.labelSmall,

      filled: false,

      counterStyle: Theme.of(context).textTheme.labelSmall,

      fillColor: Theme.of(context).colorScheme.background,
      labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: blackColor.withOpacity(.5)),

      contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
      isDense: isDense ?? true,
      labelText: label,

      floatingLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: blackColor.withOpacity(.8)),
      prefixIcon: prefixIcon,
      errorText: validator != null ? validator('') : null,
      suffix: suffixCalc != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 15,
                  height: 10,
                  child: FocusScope(
                    canRequestFocus: false,
                    child: Checkbox(
                      value: suffixCalc,
                      splashRadius: 0,
                      autofocus: false,
                      visualDensity: VisualDensity.compact,
                      onChanged: onChangedCheck,
                    ),
                  ),
                ),
                Text(
                  suffixCalcLabal ?? "",
                  style: const TextStyle(fontSize: 8),
                ),
              ],
            )
          : suffix,
      prefix: prefix,
      suffixIcon: suffixicon,

      border: UnderlineInputBorder(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.background,
        ),

        //  OutlineInputBorder(

        //   borderRadius: BorderRadius.circular(5),
        //   borderSide: BorderSide(

        //     color: Theme.of(context).colorScheme.background,
        //   ),
      ),
    );
  }
}
