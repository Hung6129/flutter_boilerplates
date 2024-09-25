import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';
import 'app_dropdown_widget.dart';
import 'lib/searchable_dropdown.dart';

class AppDropdownFieldBorderWidget extends StatelessWidget {
  AppDropdownFieldBorderWidget({
    super.key,
    required this.hint,
    required this.items,
    required this.label,
    this.isEnabled = true,
    this.onChanged,
    this.validator,
    this.value,
  });

  final String label;
  final String hint;
  final bool isEnabled;
  final String? validator;
  final String? value;
  final List<DropdownModel> items;
  final Function(DropdownModel? value)? onChanged;

  final isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SearchableDropdown<String>(
        errorText: validator,
        isEnabled: isEnabled,
        isFocused: isFocused.value,
        value: value,
        noRecordText: const AppTextWidget('Không có dữ liệu'),
        hintText: AppTextWidget(hint,
            textStyle: context.textTheme.titleSmall?.copyWith(
              overflow: TextOverflow.ellipsis,
            )),
        margin: const EdgeInsets.all(8),
        isBorderWidget: true,
        items: items
            .map(
              (e) => SearchableDropdownMenuItem<String>(
                value: e.value,
                label: e.name,
                child: AppTextWidget(
                  e.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textStyle: context.theme.textTheme.titleSmall?.copyWith(
                    color: context.theme.primaryColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: isEnabled
            ? (String? value) {
                if (isEnabled) {
                  onChanged?.call(items
                      .firstWhereOrNull((element) => element.value == value));
                }
              }
            : null,
        onFocusUnFocus: ((value) {
          FocusScope.of(context).unfocus();
          isFocused.value = value;
        }),
      ),
    );
  }
}
