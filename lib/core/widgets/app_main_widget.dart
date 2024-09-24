import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/themes/app_theme.dart';

class AppMainWidget extends StatelessWidget {
  const AppMainWidget({
    required this.body,
    super.key,
    this.scaffoldKey,
    this.appBarWidget,
    this.loadingWidget,
    this.endDrawer,
    // this.errorWidget,
    this.onSnackBar,
    this.backgroundColor,
    this.onEndDrawerChanged,
  });

  final Widget body;
  final PreferredSizeWidget? appBarWidget;
  final Color? backgroundColor;
  final Widget? loadingWidget, endDrawer;
  // final Widget Function(AppException? exception)? errorWidget;
  final Widget Function(String? message)? onSnackBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Function(bool)? onEndDrawerChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // referring issue with node focus: https://github.com/flutter/flutter/issues/54277
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor ?? AppColors.get().neutralColor[0],
        appBar: appBarWidget,
        endDrawer: endDrawer,
        // EndDrawer for Filter
        endDrawerEnableOpenDragGesture: false,
        onEndDrawerChanged: onEndDrawerChanged,
        body: Platform.isAndroid ? SafeArea(child: body) : body,
      ),
    );
  }
}
