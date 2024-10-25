// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_module/device_module.dart' as _i191;
import 'package:example/app/app_state/app_state.dart' as _i389;
import 'package:example/app/services/app_service.dart' as _i815;
import 'package:example/presentation/home_page/bloc/home_bloc.dart' as _i962;
import 'package:example/presentation/splash_page/bloc/splash_bloc.dart' as _i19;
import 'package:get_it/get_it.dart' as _i174;
import 'package:i_component_module/i_component_module.dart' as _i934;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i191.DeviceBasicInfoModule().init(gh);
    await _i934.IComponentModulePackageModule().init(gh);
    gh.lazySingleton<_i815.AppService>(() => _i815.AppService());
    gh.lazySingleton<_i962.HomeBloc>(() => _i962.HomeBloc());
    gh.lazySingleton<_i19.SplashBloc>(
        () => _i19.SplashBloc(gh<_i815.AppService>()));
    gh.lazySingleton<_i389.AppState>(
        () => _i389.AppState(gh<_i934.ThemeManager>()));
    return this;
  }
}
