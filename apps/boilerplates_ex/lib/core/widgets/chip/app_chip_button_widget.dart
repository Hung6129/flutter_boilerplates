import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';

class AppChipButtonWidget extends StatelessWidget {
  const AppChipButtonWidget({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onPressed,
  });

  final String text;
  final bool isSelected;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.get().neutralColor[0],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected
                  ? context.theme.primaryColor
                  : AppColors.get().neutralColor[30]!),
        ),
        child: AppTextWidget(
          text,
          overflow: TextOverflow.ellipsis,
          textStyle: context.textTheme.titleSmall?.copyWith(
              color: isSelected
                  ? context.theme.primaryColor
                  : AppColors.get().neutralColor[80]),
        ),
      ),
    );
  }
}
