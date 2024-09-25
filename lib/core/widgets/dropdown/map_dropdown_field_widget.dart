import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/constants/app_constants.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';
import 'app_dropdown_widget.dart';
import 'lib/searchable_dropdown.dart';

class MapSearchableDropdownWidget extends StatelessWidget {
  MapSearchableDropdownWidget({
    super.key,
    required this.hint,
    required this.items,
    this.isEnabled = true,
    this.onChanged,
    this.validator,
    this.value,
    this.onSearchTextSubmission,
  });

  final String hint;
  final bool isEnabled;
  final String? validator;
  final String? value;
  final List<DropdownModel> items;
  final Function(DropdownModel? value)? onChanged;
  final Function(String? searchText)? onSearchTextSubmission;

  final isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(AppUIConstants.majorScalePadding(4)),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      child: SearchableDropdown<String>(
        errorText: validator,
        isEnabled: isEnabled,
        isFocused: isFocused.value,
        value: value,
        isChip: false,
        isBorderWidget: true,
        trailingIcon: Icon(
          Icons.search,
          color: AppColors.get().neutralColor[80],
          size: AppUIConstants.normalIconSizeInFarmerCard,
        ),
        noRecordText: AppTextWidget(
          'Không tìm thấy tỉnh huyện xã trong phân quyền',
          textStyle: context.textTheme.bodyMedium,
        ),
        hintText: AppTextWidget(
          hint,
          textStyle: context.textTheme.bodyMedium
              ?.copyWith(color: context.theme.hintColor),
        ),
        searchHintText: hint,
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
        onChanged: (String? value) {
          if (isEnabled) {
            onChanged?.call(
                items.firstWhereOrNull((element) => element.value == value));
          }
        },
        onFocusUnFocus: ((value) {
          FocusScope.of(context).unfocus();
          isFocused.value = value;
        }),
        onSearchTextSubmission: (String? value) {
          FocusScope.of(context).unfocus();
          isFocused.value = false;
          if (isEnabled) {
            onSearchTextSubmission?.call(value);
          }
        },
      ),
    );
  }
}
