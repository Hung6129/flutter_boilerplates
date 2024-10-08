import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';

class AppChipDropdownWidget extends StatelessWidget {
  const AppChipDropdownWidget({
    super.key,
    required this.hint,
    this.isSelected = false,
    this.onPressed,
  });

  final String hint;
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
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: AppTextWidget(
                hint,
                overflow: TextOverflow.ellipsis,
                textStyle: context.textTheme.titleSmall?.copyWith(
                    color: isSelected
                        ? context.theme.primaryColor
                        : AppColors.get().neutralColor[80]),
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.arrow_drop_down,
                size: 18,
                color: isSelected
                    ? context.theme.primaryColor
                    : AppColors.get().neutralColor[80])
          ],
        ),
      ),
    );
  }
}
