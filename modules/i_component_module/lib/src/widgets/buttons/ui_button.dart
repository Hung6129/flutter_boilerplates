import 'package:flutter/material.dart';
import 'package:i_component_module/src/extensions/extensions.dart';
import 'package:i_component_module/src/widgets/ui_spacer.dart';

enum TypeButton {
  primary,
  secondary,
  ghost,
  text,
  // notification,
  icon,
}

enum ButtonSize { L, M, S }

class UIButton extends StatelessWidget {
  final String text;
  final TypeButton type;
  final ButtonSize size;
  final void Function()? onPressed;
  final bool newNotification;
  final double? gap;
  final Color? textButtonColor;
  final double? iconWidth;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? trailingIcon;

  const UIButton({
    super.key,
    required this.text,
    required this.type,
    required this.size,
    required this.onPressed,
    this.newNotification = true,
    this.gap,
    this.textButtonColor,
    this.iconWidth,
    this.icon,
    this.prefixIcon,
    this.trailingIcon,
  });

  factory UIButton.primary({
    required String text,
    required ButtonSize size,
    required void Function()? onPressed,
    double? gap,
    Color? textButtonColor,
  }) =>
      UIButton(
        text: text,
        type: TypeButton.primary,
        size: size,
        onPressed: onPressed,
        gap: gap,
        textButtonColor: textButtonColor,
      );

  factory UIButton.secondary({
    required String text,
    required ButtonSize size,
    required void Function()? onPressed,
    double? gap,
    Color? textButtonColor,
  }) =>
      UIButton(
        text: text,
        type: TypeButton.secondary,
        size: size,
        onPressed: onPressed,
        gap: gap,
        textButtonColor: textButtonColor,
      );

  factory UIButton.ghost({
    required String text,
    required ButtonSize size,
    required void Function()? onPressed,
    Widget? prefixIcon,
    double? gap,
    Color? textButtonColor,
    Widget? trailingIcon,
  }) =>
      UIButton(
        text: text,
        type: TypeButton.ghost,
        size: size,
        onPressed: onPressed,
        gap: gap,
        textButtonColor: textButtonColor,
        prefixIcon: prefixIcon,
        trailingIcon: trailingIcon,
      );

  factory UIButton.text({
    required String text,
    required ButtonSize size,
    required void Function()? onPressed,
    double? gap,
    Color? textButtonColor,
  }) =>
      UIButton(
        text: text,
        type: TypeButton.text,
        size: size,
        onPressed: onPressed,
        gap: gap,
        textButtonColor: textButtonColor,
      );

  // factory UIButton.notification({
  //   bool newNotification = true,
  //   required void Function()? onPressed,
  // }) =>
  //     UIButton(
  //       text: '',
  //       type: TypeButton.notification,
  //       size: ButtonSize.L,
  //       onPressed: onPressed,
  //       newNotification: newNotification,
  //     );

  factory UIButton.icon({
    required Widget icon,
    required void Function()? onPressed,
    double? iconWidth,
  }) =>
      UIButton(
        text: '',
        icon: icon,
        type: TypeButton.icon,
        size: ButtonSize.M,
        onPressed: onPressed,
        iconWidth: iconWidth,
      );

  final _paddingS = 8;
  final _paddingM = 16;
  // final _paddingL = 24;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      TypeButton.primary => _primaryButton(context),
      TypeButton.secondary => _secondaryButton(context),
      TypeButton.ghost => _ghostButton(context),
      TypeButton.text => _textButton(context),
      // TypeButton.notification => _notificationButton(context),
      TypeButton.icon => _iconButton(context),
    };
  }

  Widget _iconButton(BuildContext context) {
    return IconButton(
      constraints: BoxConstraints.tightFor(width: iconWidth, height: iconWidth),
      icon: icon!,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
    );
  }

  Widget _primaryButton(BuildContext context) {
    final style = switch (size) {
      ButtonSize.L => ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: context.font.buttonL,
          foregroundColor: textButtonColor,
          fixedSize: Size.fromHeight(context.dimens.buttonHeightL),
        ),
      ButtonSize.M => ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: context.font.buttonM,
          foregroundColor: textButtonColor,
          fixedSize: Size.fromHeight(context.dimens.buttonHeightM),
          minimumSize: Size.fromHeight(context.dimens.buttonHeightM),
        ),
      ButtonSize.S => ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: context.font.buttonS,
          foregroundColor: textButtonColor,
          fixedSize: Size.fromHeight(context.dimens.buttonHeightS),
          minimumSize: Size(
              text.getWidthByStyle(context.font.buttonS) +
                  (gap ?? _paddingS * 2),
              context.dimens.buttonHeightS),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
        ),
    };

    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }

  Widget _secondaryButton(BuildContext context) {
    final style = Theme.of(context).elevatedButtonTheme.style?.copyWith(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return context.color.neutral.seven;
          } else if (states.contains(WidgetState.pressed)) {
            return context.color.neutral.zero;
          }
          return context.color.neutral.zero;
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return context.color.neutral.six;
          }
          return context.color.neutral.seven;
        },
      ),
    );

    final buttonStyle = switch (size) {
      ButtonSize.L => style?.copyWith(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          textStyle:
              WidgetStateProperty.all<TextStyle>(context.font.buttonL.apply(
            color: textButtonColor,
          )),
          fixedSize: WidgetStateProperty.all<Size>(
              Size.fromHeight(context.dimens.buttonHeightL)),
        ),
      ButtonSize.M => style?.copyWith(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          textStyle:
              WidgetStateProperty.all<TextStyle>(context.font.buttonM.apply(
            color: textButtonColor,
          )),
          fixedSize: WidgetStateProperty.all<Size>(
              Size.fromHeight(context.dimens.buttonHeightM)),
        ),
      ButtonSize.S => style?.copyWith(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          textStyle:
              WidgetStateProperty.all<TextStyle>(context.font.buttonS.apply(
            color: textButtonColor,
          )),
          fixedSize: WidgetStateProperty.all<Size>(
              Size.fromHeight(context.dimens.buttonHeightS)),
          minimumSize: WidgetStateProperty.all<Size>(
            Size(
                text.getWidthByStyle(context.font.buttonS) +
                    (gap ?? _paddingS * 2),
                context.dimens.buttonHeightS),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        ),
    };

    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        text,
        style: buttonStyle?.textStyle
            ?.resolve({WidgetState.pressed, WidgetState.disabled}),
      ),
    );
  }

  Widget _ghostButton(BuildContext context) {
    final style = switch (size) {
      ButtonSize.L => OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: context.font.buttonL,
          foregroundColor: textButtonColor,
          fixedSize: Size.fromHeight(context.dimens.buttonHeightL),
          minimumSize: Size.fromHeight(context.dimens.buttonHeightL),
          // minimumSize: Size(
          //     text.getWidthByStyle(context.font.buttonL) +
          //         (gap ?? _paddingL * 2),
          //     context.dimens.buttonHeightL),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
        ),
      ButtonSize.M => OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: context.font.buttonM,
          foregroundColor: textButtonColor,
          fixedSize: Size.fromHeight(
            context.dimens.buttonHeightM,
          ),
          // minimumSize: Size.fromHeight(context.dimens.buttonHeightM),
          minimumSize: Size(
              text.getWidthByStyle(context.font.buttonM) +
                  (gap ?? _paddingM * 2) +
                  (prefixIcon != null ? 24 : 0),
              context.dimens.buttonHeightM),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
        ),
      ButtonSize.S => OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: context.font.buttonS,
          fixedSize: Size.fromHeight(context.dimens.buttonHeightS),
          foregroundColor: textButtonColor,
          minimumSize: Size(
              text.getWidthByStyle(context.font.buttonS) +
                  (gap ?? _paddingS * 2) +
                  (prefixIcon != null ? 16 : 0),
              context.dimens.buttonHeightS),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
        ),
    };

    return OutlinedButton(
      style: style,
      onPressed: onPressed,
      child: buildOutline(),
    );
  }

  Widget buildOutline() {
    if (prefixIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          UISpacer.w(dimen: 8),
          prefixIcon!,
          UISpacer.w(dimen: 8),
          Text(text),
          UISpacer.w(dimen: 8),
        ],
      );
    } else if (trailingIcon != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            UISpacer.w(dimen: 8),
            trailingIcon!,
          ],
        ),
      );
    } else {
      return Text(
        text,
      );
    }
  }

  Widget _textButton(BuildContext context) {
    final style = switch (size) {
      ButtonSize.L => ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: context.font.buttonL,
          foregroundColor: textButtonColor,
          fixedSize: Size.fromHeight(context.dimens.buttonHeightL),
        ),
      ButtonSize.M => ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: context.font.buttonM,
          foregroundColor: textButtonColor,
          fixedSize: Size.fromHeight(context.dimens.buttonHeightM),
        ),
      ButtonSize.S => ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          foregroundColor: textButtonColor,
          textStyle: context.font.buttonS,
          fixedSize: Size.fromHeight(context.dimens.buttonHeightS),
        ),
    };

    return TextButton(
      style: style,
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
