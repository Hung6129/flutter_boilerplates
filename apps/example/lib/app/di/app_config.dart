import 'package:device_module/device_module.dart';
import 'package:example/app/di/app_config.config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:i_component_module/i_component_module.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(DeviceBasicInfoModule),
    ExternalModule(IComponentModulePackageModule),
  ],
  externalPackageModulesAfter: [],
)
Future<GetIt> setupLocator(String mode) async => getIt.init(environment: mode);

final class AppConfig {
  static Future<void> configureDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator('dev');
  }
}
