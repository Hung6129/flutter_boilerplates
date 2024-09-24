import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';
import 'package:flutter_boilerplates/core/services/reachability_service.dart';
import 'package:flutter_boilerplates/features/boilerplate.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put<ReachabilityService>(ReachabilityServiceImpl());
    return MaterialApp(
      title: 'Flutter Boilerplate Demo',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      home: const Boilerplate(),
    );
  }
}
