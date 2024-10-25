import 'package:device_module/device_module.dart';
import 'package:flutter/material.dart';
import 'package:i_component_module/i_component_module.dart';
import 'package:i_core_modules/i_core_modules.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
final class AppState extends BaseAppState {
  final ThemeManager _themeManager;

  AppState(
    this._themeManager,
  );
  @override
  Future<void> initAppState() async {}

  String get appVersion =>
      '${DeviceHelper.getAppVersion()}+${DeviceHelper.getBuildVersion()}';

  @override
  ThemeMode get themeMode => _themeManager.themeMode;

  @override
  AppDarkTheme get darkTheme => _themeManager.baseDarkTheme;

  @override
  AppLightTheme get lightTheme => _themeManager.baseLightTheme;

  @override
  BaseTheme<AppThemeOptions> get currentTheme => _themeManager.currentTheme;

  @override
  AppColor get appColor => currentTheme.options!.color;

  @override
  AppFont get appFont => currentTheme.options!.font;
}
