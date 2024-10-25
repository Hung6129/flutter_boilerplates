import 'package:example/app/extensions/context_extensions.dart';
import 'package:example/presentation/splash_page/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:i_core_modules/i_core_modules.dart';

import 'app/app_state/app_state.dart';
import 'app/di/app_config.dart';

Future<void> main() async {
  await AppConfig.configureDependencies();

  runApp(AppScope<AppState>(
    notifier: getIt<AppState>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: context.appState.themeMode,
      theme: context.appState.lightTheme.data,
      darkTheme: context.appState.darkTheme.data,
      home: const SplashPage(),
    );
  }
}
