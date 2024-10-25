//@GeneratedMicroModule;IComponentModulePackageModule;package:i_component_module/i_component_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:i_component_module/src/theme/app_theme.dart' as _i1000;
import 'package:injectable/injectable.dart' as _i526;

class IComponentModulePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i1000.LightThemeOptions>(
        () => _i1000.LightThemeOptions());
    gh.lazySingleton<_i1000.DarkThemeOptions>(() => _i1000.DarkThemeOptions());
    gh.lazySingleton<_i1000.AppLightTheme>(
        () => _i1000.AppLightTheme(gh<_i1000.LightThemeOptions>()));
    gh.lazySingleton<_i1000.AppDarkTheme>(
        () => _i1000.AppDarkTheme(gh<_i1000.DarkThemeOptions>()));
    gh.factory<_i1000.ThemeManager>(() => _i1000.ThemeManager(
          gh<_i1000.AppDarkTheme>(),
          gh<_i1000.AppLightTheme>(),
        ));
  }
}
