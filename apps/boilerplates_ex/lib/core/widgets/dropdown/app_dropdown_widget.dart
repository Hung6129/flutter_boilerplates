import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';

class DropdownModel {
  final String value;
  final String name;
  bool isSelected;

  DropdownModel(
      {required this.value, required this.name, this.isSelected = false});
}

class AppDropdownWidget extends StatelessWidget {
  const AppDropdownWidget({
    super.key,
    required this.hint,
    required this.items,
    this.onChange,
    this.prefix,
    this.suffix,
    this.buttonBorder,
    this.buttonPadding,
    this.buttonColor,
  });
  final String hint;
  final List<DropdownModel> items;
  final Function(DropdownModel? value)? onChange;
  final Widget? prefix;
  final Widget? suffix;
  final BoxBorder? buttonBorder;
  final EdgeInsetsGeometry? buttonPadding;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    final isSelected =
        items.firstWhereOrNull((element) => element.isSelected)?.value != null;
    final valueSelected =
        items.firstWhereOrNull((element) => element.isSelected)?.value;
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        iconStyleData: IconStyleData(
          iconSize: 18,
          iconEnabledColor: isSelected
              ? suffix != null
                  ? Colors.transparent
                  : context.theme.primaryColor
              : context.theme.hintColor,
          iconDisabledColor: context.theme.disabledColor,
        ),
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            color: buttonColor ?? context.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(8),
            border: buttonBorder,
          ),
          height: 32,
          padding: buttonPadding ??
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        hint: AppTextWidget(
          hint,
          textStyle: context.textTheme.bodyMedium
              ?.copyWith(color: context.theme.colorScheme.outline),
        ),
        disabledHint: AppTextWidget(
          hint,
          textStyle: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.disabledColor,
          ),
        ),
        value: items.firstWhereOrNull((element) => element.isSelected)?.value,
        alignment: AlignmentDirectional.centerStart,
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e.value,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: kMinInteractiveDimension,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  color: context.theme.colorScheme.background,
                  child: Row(
                    children: [
                      AppTextWidget(
                        e.name,
                        textStyle: context.textTheme.labelLarge,
                      ),
                      if (e.value == valueSelected) const SizedBox(width: 12),
                      if (e.value == valueSelected)
                        Icon(
                          Icons.check_rounded,
                          color: context.theme.primaryColor,
                          size: 16,
                        ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        selectedItemBuilder: (context) => items
            .map(
              (e) => Row(
                children: [
                  if (prefix != null) prefix!,
                  if (prefix != null) const SizedBox(width: 8),
                  AppTextWidget(
                    e.name,
                    textStyle: context.textTheme.titleSmall
                        ?.copyWith(color: context.theme.primaryColor),
                  ),
                  // Space for Icons.check_rounded
                  if (suffix == null) const SizedBox(width: 12),
                  if (suffix != null) suffix!,
                ],
              ),
            )
            .toList(),
        onChanged: (value) => onChange
            ?.call(items.firstWhereOrNull((element) => element.value == value)),
      ),
    );
  }
}
