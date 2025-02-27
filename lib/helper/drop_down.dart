// ignore_for_file: unnecessary_null_comparison

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mine/config/color/main_color_list.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/helper/form_widgets.dart';
import 'package:project/helper/validator.dart';

class CustomDropDown<T extends Object> extends StatelessWidget {
  final T? value;
  final List<T>? items;
  final Widget Function(BuildContext p1, T? p2)? dropdownBuilder;
  final String? label;
  final String Function(T value)? itemAsString;
  final void Function(T? value)? onChanged;
  final void Function(T?)? onSaved;
  final void Function()? onAdd;
  final List<Validator<T>> validator;
  final ClearButtonProps? clearButtonProps;
  final DropDownDecoratorProps? dropdownDecoratorProps;
  final Future<List<T>> Function(String)? asyncItems;
  final Future<List<T>> Function(String)? reloadItems;
  final PopupProps<T>? popupProps;
  final bool Function(T, String)? filterFn;
  final DropdownButtonProps? dropdownButtonProps;
  final bool canAdd;
  final bool canClear;
  final Widget? counter;
  final double width;
  final double height;
  final Widget Function(BuildContext, T, bool)? itemBuilder;
  final bool Function(T, T)? compareFn;
  final bool? enabled;
  final EdgeInsetsGeometry? padding;
  final double? vertical;

  const CustomDropDown({
    super.key,
    this.value,
    this.items,
    this.dropdownBuilder,
    this.itemAsString,
    required this.onChanged,
    this.onAdd,
    this.dropdownDecoratorProps,
    this.onSaved,
    required this.label,
    this.clearButtonProps,
    this.validator = const [],
    this.asyncItems,
    this.reloadItems,
    this.popupProps,
    this.dropdownButtonProps,
    this.filterFn,
    this.counter,
    this.compareFn,
    this.width = 200,
    this.canAdd = false,
    this.itemBuilder,
    this.enabled,
    this.padding = const EdgeInsets.symmetric(vertical: 22),
    this.vertical,
    this.canClear = false,
    this.height = 46,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: _buildDropdownSearch(context),
        ),
        if (canAdd == true)
          const SizedBox(
            width: 5,
          ),
        if (canAdd == true)
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                onAdd?.call();
              },
              icon: Icon(Icons.add, size: 20, color: Theme.of(context).primaryColor),
            ),
          ),
      ],
    );
  }

  Widget _buildDropdownSearch(BuildContext context) {
    return DropdownSearch<T>(
      enabled: enabled ?? true,
      dropdownButtonProps: dropdownButtonProps ?? _buildDropdownButtonProps(context),
      popupProps: _buildPopupProps(context),
      selectedItem: value,
      asyncItems: asyncItems,
      clearButtonProps: _buildClearButtonProps(context),
      dropdownDecoratorProps: dropdownDecoratorProps ?? _buildDropDownDecoratorProps(context),
      itemAsString: itemAsString,
      items: items ?? [],
      onSaved: onSaved,
      validator: _buildValidator,
      compareFn: compareFn,
      onChanged: onChanged,
      filterFn: filterFn,
    );
  }

  DropdownButtonProps _buildDropdownButtonProps(BuildContext context) {
    return DropdownButtonProps(
      focusColor: transparentColor,
      padding: padding ?? const EdgeInsets.all(14),
      visualDensity: VisualDensity.compact,
      icon: Icon(
        canAdd ? Icons.add : Icons.arrow_drop_down,
        size: 20,
        color: blackColor.withOpacity(.5),
      ).onTap(canAdd == true ? onAdd : null),
    );
  }

  ClearButtonProps _buildClearButtonProps(BuildContext context) {
    return clearButtonProps ??
        ClearButtonProps(
          constraints: const BoxConstraints.tightFor(width: 25, height: 20),
          visualDensity: VisualDensity.compact,
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(0),
          isVisible: canClear,
          iconSize: 20,
          icon: const Icon(Icons.clear),
          focusColor: transparentColor,
          color: Theme.of(context).colorScheme.primary,
        );
  }

  String? _buildValidator(T? value) {
    for (Validator<T> v in validator) {
      String? error = v.validator(value);
      if (error != null) return error;
    }
    return null;
  }

  DropDownDecoratorProps _buildDropDownDecoratorProps(BuildContext context) {
    return DropDownDecoratorProps(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        dropdownSearchDecoration: CustomInputDecoration.build(
          context: context,
          label: "$label",
          counter: counter,
          decoration: true,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 0.5, color: context.mainColors.ashGrey!)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 0.5, color: context.mainColors.primary!),
          ),
          contentPadding: const EdgeInsets.fromLTRB(8, 7.5, 1, 7.5),
          // contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: vertical ?? 15),
        ));
  }

  PopupProps<T> _buildPopupProps(BuildContext context) {
    return popupProps ??
        PopupProps<T>.menu(
          showSearchBox: true,
          searchFieldProps: _buildSearchFieldProps(context),
          searchDelay: const Duration(milliseconds: 0),
          fit: FlexFit.tight,
          itemBuilder: itemBuilder ??
              (BuildContext context, ss, dd) {
                return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ListTile(
                      tileColor: whiteColor,
                      title: Text(ss.toString(), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: blackColor)),
                    ));
              },
          menuProps: MenuProps(shadowColor: grey, backgroundColor: whiteColor, borderRadius: BorderRadius.circular(15)),
          loadingBuilder: (context, searchEntry) {
            return const Center(child: CircularProgressIndicator());
          },

          // title: Text("$label"),
          // isFilterOnline:true ,

          //  menuProps: MenuProps(elevation: 5

          //  ),
          emptyBuilder: (context, searchEntry) {
            return const Center(
              child: Text("No items found"),
            );
          },
        );
  }

  TextFieldProps _buildSearchFieldProps(BuildContext context) {
    return TextFieldProps(
      padding: const EdgeInsets.all(8),
      autofocus: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400, width: .8)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: .8)),
        isDense: true,
        filled: true,
        fillColor: whiteColor,
        prefixIcon: const Icon(Icons.search),
        // suffix: _buildSearchSuffixIcon(),
        hintText: "search",
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(),
      ),
    );
  }
}
