import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/constants/app_constants.dart';
import 'package:flutter_boilerplates/config/translations/strings.dart';
import 'package:flutter_boilerplates/core/utils/widget_utils.dart';
import 'package:flutter_boilerplates/core/widgets/buttons/app_filled_button_widget.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';

class AppBottomSheetWidget {
  const AppBottomSheetWidget._();

  static Future<void> _showBaseBottomSheetWidget(BuildContext context,
      {required String label, required Widget child}) async {
    await showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextWidget(label, textStyle: context.textTheme.titleLarge),
              const SizedBox(height: 24),
              child,
              WidgetUtils.footerSpace(),
            ]),
      ),
    );
  }

  static Future<void> showBottomSheetPickImageWidget(BuildContext context,
      {Function? onPickerImage, Function? onPickerCamera}) async {
    await _showBaseBottomSheetWidget(
      context,
      label: Strings.selector,
      child: Column(
        children: [
          AppFilledButtonWidget(
            Strings.selectorGalleryImage,
            onPressed: () => {Get.back(), onPickerImage?.call()},
          ),
          SizedBox(height: AppUIConstants.majorScaleMargin(4)),
          AppFilledButtonWidget(
            Strings.selectorCamera,
            onPressed: () => {Get.back(), onPickerCamera?.call()},
          ),
        ],
      ),
    );
  }

  static Future<void> showBottomSheetPickVideoWidget(BuildContext context,
      {Function? onPickerVideo, Function? onPickerCamera}) async {
    await _showBaseBottomSheetWidget(
      context,
      label: Strings.selector.tr,
      child: Column(
        children: [
          AppFilledButtonWidget(
            Strings.selectorGallery,
            onPressed: () => {Get.back(), onPickerVideo?.call()},
          ),
          SizedBox(height: AppUIConstants.majorScaleMargin(4)),
          AppFilledButtonWidget(
            Strings.selectorVideo,
            onPressed: () => {Get.back(), onPickerCamera?.call()},
          ),
        ],
      ),
    );
  }
}