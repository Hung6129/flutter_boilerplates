import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:i_component_module/src/theme/app_font.dart';
import 'package:i_component_module/src/theme/app_theme.dart';
import 'package:i_component_module/src/theme/base_theme.dart';
import 'package:i_component_module/src/theme/colors/app_color.dart';
import 'package:i_component_module/src/theme/dimensions.dart';

extension AppThemeContextExt on BuildContext {
  ThemeManager get themeManager => GetIt.I<ThemeManager>();

  BaseTheme<AppThemeOptions> get theme => themeManager.currentTheme;

  AppColor get color => theme.options!.color;

  AppFont get font => theme.options!.font;

  TextTheme get textTheme => theme.data.textTheme;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double get bottom => MediaQuery.of(this).padding.bottom;

  void get hideKeyboard => FocusScope.of(this).unfocus();

  BaseAppDimens get dimens => theme.options!.dimens;
}
