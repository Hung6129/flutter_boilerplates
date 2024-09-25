import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/config/translations/strings.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';
import 'app_dropdown_widget.dart';
import 'lib/searchable_dropdown.dart';

class AppDropdownFieldWidget extends StatelessWidget {
  AppDropdownFieldWidget({
    super.key,
    required this.hint,
    required this.items,
    required this.label,
    this.isEnabled = true,
    this.onChanged,
    this.validator,
    this.value,
    this.isRequired = false,
    this.isViewTextOnly = false,
    this.isHasSearchBox = true,
  });

  final String label;
  final String hint;
  final bool isEnabled;
  final String? validator;
  final String? value;
  final bool isRequired;
  final bool isViewTextOnly;
  final bool isHasSearchBox;
  final List<DropdownModel> items;
  final Function(DropdownModel? value)? onChanged;

  final isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextWidget(
              label,
              textStyle: context.textTheme.bodySmall?.copyWith(
                color: AppColors.get().neutralColor[60],
              ),
            ),
            if (isRequired) const SizedBox(width: 2),
            if (isRequired && !isViewTextOnly)
              AppTextWidget(
                '*',
                textStyle: context.textTheme.bodySmall
                    ?.copyWith(color: context.theme.colorScheme.error),
              )
          ],
        ),
        isViewTextOnly
            ? Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 8),
                child: AppTextWidget(
                  items
                          .firstWhereOrNull((element) => element.value == value)
                          ?.name ??
                      '--',
                  textStyle: context.textTheme.bodyMedium,
                ),
              )
            : SearchableDropdown<String>(
                errorText: validator,
                isEnabled: isEnabled,
                isFocused: isFocused.value,
                isHasSearchBox: isHasSearchBox,
                value: value,
                noRecordText: AppTextWidget(
                  Strings.emptyMessage.tr,
                  textStyle: context.textTheme.bodyMedium,
                ),
                hintText: AppTextWidget(
                  hint,
                  textStyle: context.textTheme.bodyMedium
                      ?.copyWith(color: context.theme.hintColor),
                ),
                items: items
                    .map(
                      (e) => SearchableDropdownMenuItem<String>(
                        value: e.value,
                        label: e.name,
                        child: AppTextWidget(
                          e.name,
                          textStyle: context.textTheme.bodyMedium,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: isEnabled
                    ? (String? value) {
                        if (isEnabled) {
                          onChanged?.call(items.firstWhereOrNull(
                              (element) => element.value == value));
                        }
                      }
                    : null,
                onFocusUnFocus: ((value) {
                  FocusScope.of(context).unfocus();
                  isFocused.value = value;
                }),
              )
      ],
    );
  }
}
