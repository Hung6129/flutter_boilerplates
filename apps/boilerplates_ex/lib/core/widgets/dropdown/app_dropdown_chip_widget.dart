import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/translations/strings.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';
import 'app_dropdown_widget.dart';
import 'lib/searchable_dropdown.dart';

class AppDropdownChipWidget extends StatelessWidget {
  AppDropdownChipWidget({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    required this.hint,
  });

  final String? value;
  final String hint;
  final List<DropdownModel> items;
  final Function(DropdownModel? value)? onChanged;

  final isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return SearchableDropdown<String>(
      isFocused: isFocused.value,
      value: value,
      isChip: true,
      noRecordText: AppTextWidget(
        Strings.emptyMessage.tr,
        textStyle: context.textTheme.bodyMedium,
      ),
      chipLabel:
          items.firstWhereOrNull((element) => element.value == value)?.name ??
              hint,
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
      onChanged: (value) {
        onChanged
            ?.call(items.firstWhereOrNull((element) => element.value == value));
      },
      onFocusUnFocus: ((value) {
        FocusScope.of(context).unfocus();
        isFocused.value = value;
      }),
    );
  }
}
