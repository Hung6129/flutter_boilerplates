import 'dart:io';

import 'package:device_module/device_module.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:permission_handler/permission_handler.dart';

mixin FileMixin {
  Future<bool> saveQRImageFromBytes(Uint8List bytes) async {
    try {
      if(Platform.isIOS){
        await SharingHelper.shareBytes(bytes, name: 'mission_qr_code');
      }
      else if(Platform.isAndroid){
        await Gal.putImageBytes(
          bytes,
          name: 'mission_qr_code',
        );
      }

      return true;
    } on GalException catch (e) {
      switch(e.type){
        case GalExceptionType.accessDenied:
          await openAppSettings();
          break;
        case GalExceptionType.notEnoughSpace:
          notEnoughSpace();
          break;
        case GalExceptionType.notSupportedFormat:
        case GalExceptionType.unexpected:
          return false;
        default:
          return false;
      }
      return false;
    }
  }

  void notEnoughSpace();
}
