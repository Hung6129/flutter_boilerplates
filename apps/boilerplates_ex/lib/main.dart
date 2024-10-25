import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/core/services/reachability_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'core/services/injection_service.dart';
import 'core/services/state_observer.dart';
import 'features/walkthrough/page/walkthrough_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InjectionService.registerServices();
  Bloc.observer = StateBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put<ReachabilityService>(ReachabilityServiceImpl());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Boilerplate Demo',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'vi_VN'),
      ],
      home: const WalkThroughPage(),
    );
  }
}
