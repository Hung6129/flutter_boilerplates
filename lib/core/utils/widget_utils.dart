import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplates/config/constants/app_constants.dart';

class WidgetUtils {
  static Widget footerSpace() {
    if (Platform.isAndroid) {
      return const SizedBox(
        height: 32,
      );
    } else {
      return SizedBox(height: AppUIConstants.majorScalePadding(4));
    }
  }
}
