import 'package:screen_brightness/screen_brightness.dart';
import 'package:vibration/vibration.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final class DeviceHardwareHelper {
  static Future<void> wakeLockEnable() {
    return WakelockPlus.enable();
  }

  static Future<void> wakeLockDisable() {
    return WakelockPlus.disable();
  }

  static Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {}
  }

  static Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {}
  }

  static Future<void> vibrate() {
    return Vibration.vibrate();
  }
}
