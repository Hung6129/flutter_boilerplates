import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_module/src/basic_info/android_device_id.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceHelper {
  static String getOS() => Platform.operatingSystem;

  static String getOSVersion() => Platform.operatingSystemVersion;

  static String getLanguage() => Platform.localeName;

  static String getAppVersion() => GetIt.I<PackageInfo>().version;

  static String getBuildVersion() => GetIt.I<PackageInfo>().buildNumber;

  static String getDeviceId() {
    if (Platform.isAndroid) {
      final deviceInfo = GetIt.I<AndroidDeviceId>();
      return deviceInfo.deviceId ?? '';
    } else if (Platform.isIOS) {
      final deviceInfo = GetIt.I<BaseDeviceInfo>() as IosDeviceInfo;
      return deviceInfo.identifierForVendor ?? '';
    }
    return '';
  }

  static int getAndroidVersionSDK() {
    if (Platform.isAndroid) {
      final deviceInfo = GetIt.I<BaseDeviceInfo>() as AndroidDeviceInfo;
      return deviceInfo.version.sdkInt;
    }
    return -1;
  }

  static String getMobileBrandName() {
    if (Platform.isAndroid) {
      final deviceInfo = GetIt.I<BaseDeviceInfo>() as AndroidDeviceInfo;
      return deviceInfo.manufacturer;
    } else if (Platform.isIOS) {
      return 'Apple';
    }
    return '';
  }

  static bool isPhysicalDevice() {
    if (Platform.isAndroid) {
      final deviceInfo = GetIt.I<BaseDeviceInfo>() as AndroidDeviceInfo;
      return deviceInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      final deviceInfo = GetIt.I<BaseDeviceInfo>() as IosDeviceInfo;
      return deviceInfo.isPhysicalDevice;
    }
    return false;
  }

  static String getMobileModelName() {
    if (Platform.isAndroid) {
      final deviceInfo = GetIt.I<BaseDeviceInfo>() as AndroidDeviceInfo;
      return deviceInfo.model;
    } else if (Platform.isIOS) {
      final deviceInfo = GetIt.I<BaseDeviceInfo>() as IosDeviceInfo;
      return deviceInfo.model;
    }
    return '';
  }

  static bool getIsLimitedAdTracking() {
    return false;
  }

  static String getPlatform() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'IOS';
    } else if (Platform.isMacOS) {
      return 'MacOS';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isLinux) {
      return 'Linux';
    }
    return '';
  }

  static String getPackageName() {
    return GetIt.I<PackageInfo>().packageName;
  }
}
