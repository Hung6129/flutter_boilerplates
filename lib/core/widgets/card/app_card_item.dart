import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/core/widgets/texts/app_text_widget.dart';
import 'package:get/get.dart';

class AppCartItemContentWithIcon extends StatelessWidget {
  const AppCartItemContentWithIcon({
    super.key,
    required this.icon,
    required this.content,
  });

  final Widget icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Flexible(
          child: AppTextWidget(
            content.isNotEmpty ? content : '--',
            textStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.theme.appColor.neutralColor[80],
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
