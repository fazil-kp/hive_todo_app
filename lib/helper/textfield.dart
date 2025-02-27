import 'package:flutter/material.dart';
import 'package:auto_binding_field/auto_binding_field.dart';
import 'package:flutter/services.dart';
import 'package:mine/config/color/main_color_list.dart';
import 'package:mine/config/responsive/responsive_helper.dart';

import 'package:nb_utils/nb_utils.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? value;
  final String? value2;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool?>? onChangedCheck;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final bool isNumeric;
  final Widget? prefix;
  final Widget? suffix;
  final bool? suffixCalc;
  final bool? suffixP;
  final String? suffixCalcLabal;
  final Widget? suffixicon;
  final Widget? prefixIcon;
  final bool autoFocus;
  final List<FormFieldValidator<String>>? validators;
  final FocusNode? focusNode;
  final bool? isDense;
  final Widget? counter;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final bool? isPassword;
  final bool? readOnly;
  final bool? textAndHead;
  final double width;
  final double? height;
  final double? contentPaddingVertical;
  final Color? hintColor;
  final Color? constBoarderColor;
  final Color? constTextColor;

  const CustomTextField({
    super.key,
    this.label,
    this.prefix,
    this.suffix,
    this.suffixicon,
    this.hintText,
    this.value,
    this.value2,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType,
    this.focusNode,
    this.textInputAction,
    this.isNumeric = false,
    this.onSaved,
    this.isDense,
    this.maxLines,
    this.onEditingComplete,
    this.prefixIcon,
    this.validators,
    this.isPassword,
    this.decoration,
    this.counter,
    this.suffixCalc,
    this.suffixP,
    this.suffixCalcLabal,
    this.onChangedCheck,
    this.readOnly,
    this.autoFocus = false,
    this.inputFormatters,
    this.width = 200,
    this.textAndHead = false,
    this.height = 46,
    this.contentPaddingVertical = 44,
    this.hintColor,
    this.constBoarderColor,
    this.constTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return textAndHead ?? false ? _buildTextField(context) : _buildAutoBindingTextField(context);
  }

  Widget _buildTextField(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefix != null) prefix ?? const SizedBox(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label ?? "",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: blackColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      value ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAutoBindingTextField(BuildContext context) {
    // final respo = ScrelHelper.isDesktop(context.width());
    final respo = ResponsiveHelper.isDesktop(context);
    return SizedBox(
      width: width,
      height: height,
      child: AutoBindingTextField(
          keyboardType: keyboardType,
          autoFocus: autoFocus,
          onEditingComplete: onEditingComplete,
          mandatory: false,
          outSideLabel: false,
          readOnly: readOnly ?? false,
          key: key,
          isPassword: isPassword ?? false,
          value: suffixCalc ?? false ? value2 : value,
          onChanged: onChanged,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          enabled: true,
          maxLines: maxLines ?? 1,
          ourSideLabelGap: 0,
          textInputAction: TextInputAction.next,
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
          isPrimarySelect: true,
          validator: validator,
          focusNode: focusNode,
          decoration: decoration ??
              InputDecoration(
                isDense: true,
                fillColor: Colors.transparent,
                hintText: hintText,
                labelText: label,
                suffix: suffix,
                prefix: prefix,
                prefixIcon: prefixIcon,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 0.5, color: constBoarderColor ?? context.mainColors.ashGrey!)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 0.5, color: constBoarderColor ?? redColor)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: BorderSide(width: 0.5, color: constBoarderColor ?? context.mainColors.ashGrey!)),
                contentPadding: respo
                    ? contentPaddingVertical != null
                        ? EdgeInsets.only(top: contentPaddingVertical ?? 19, left: 10, right: 10)
                        : const EdgeInsets.symmetric(horizontal: 20, vertical: 19)
                    : contentPaddingVertical != null
                        ? EdgeInsets.only(top: contentPaddingVertical ?? 19, left: 10, right: 10)
                        : const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
                labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: blackColor),
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: hintColor ?? blackColor.withOpacity(.5), fontSize: respo ? 12 : 12, fontWeight: FontWeight.w400),
                counterText: '',
              ),
          inputFormatters: inputFormatters),
    );
  }
}
