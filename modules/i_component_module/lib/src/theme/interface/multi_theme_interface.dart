import 'package:flutter/material.dart';
import 'package:i_component_module/src/theme/app_font.dart';
import 'package:i_component_module/src/theme/app_theme.dart';
import 'package:i_component_module/src/theme/base_theme.dart';
import 'package:i_component_module/src/theme/colors/app_color.dart';

abstract interface class MultiThemes {
  AppLightTheme get lightTheme;

  AppDarkTheme get darkTheme;

  ThemeMode get themeMode;

  AppColor get appColor;

  AppFont get appFont;

  BaseTheme<AppThemeOptions> get currentTheme;

  Future<void> changeTheme(ThemeMode mode);
}
