import 'package:example/app/app_state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:i_component_module/i_component_module.dart';
import 'package:i_core_modules/i_core_modules.dart';

extension ContextExt on BuildContext {
  AppState get appState => AppScope.of<AppState>(this);

  void get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();

  String get appVersion => appState.appVersion;

  AppThemeOptions get appTheme => appState.currentTheme.options!;

  AppColor get color => appState.appColor;

  AppFont get font => appState.appFont;
}
