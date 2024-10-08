import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/constants/app_constants.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';

enum ButtonSize { regular, small }

class AppFilledButtonWidget extends StatelessWidget {
  const AppFilledButtonWidget(
    this.text, {
    this.isEnable = true,
    this.onPressed,
    this.style,
    this.prefixIcon,
    this.textStyle,
    this.fillColor,
    this.buttonSize = ButtonSize.regular,
    this.wrapContent = false,
    super.key,
  });

  final String text;
  final bool isEnable;
  final Widget? prefixIcon;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Function? onPressed;
  final Color? fillColor;
  final ButtonSize buttonSize;
  final bool wrapContent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable ? () => onPressed?.call() : null,
      highlightColor: context.theme.primaryColor,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: buttonSize == ButtonSize.regular
            ? const EdgeInsets.all(10)
            : const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: fillColor == null
              ? LinearGradient(
                  colors: [
                    isEnable
                        ? context.theme.primaryColorLight
                        : context.theme.disabledColor,
                    isEnable
                        ? context.theme.primaryColor
                        : context.theme.disabledColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                )
              : null,
          color: fillColor,
        ),
        child: wrapContent
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppUIConstants.majorScalePadding(5),
                ),
                child: _buildText(context),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  if (prefixIcon != null) const SizedBox(width: 12),
                  _buildText(context),
                ],
              ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return AppTextWidget(
      text,
      textAlign: TextAlign.center,
      textStyle: textStyle ??
          context.textTheme.titleSmall?.copyWith(
            color: isEnable
                ? context.theme.colorScheme.onPrimary
                : AppColors.get().neutralColor[40],
          ),
    );
  }
}
