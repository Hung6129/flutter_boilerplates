import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

export 'package:geolocator/geolocator.dart' show Position;

final class LocationHelper {
  static Stream<Position> positionStream = Geolocator.getPositionStream(
      locationSettings: Platform.isAndroid
          ? AndroidSettings(
              accuracy: LocationAccuracy.reduced,
              distanceFilter: 100,
              intervalDuration: const Duration(minutes: 5),
            )
          : AppleSettings(
              distanceFilter: 100,
              allowBackgroundLocationUpdates: false,
            ));

  static Future<Position?> determinePosition(
      {LocationAccuracy desiredAccuracy = LocationAccuracy.medium,
      Duration timeout = const Duration(seconds: 5),
      bool useLastKnownLocation = true}) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (![
      LocationPermission.whileInUse,
      LocationPermission.always,
    ].contains(permission)) {
      return null;
    }

    try {
      final currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: desiredAccuracy, timeLimit: timeout);

      return currentLocation;
    } catch (e) {
      final lastKnownLocation = await Geolocator.getLastKnownPosition();
      if (lastKnownLocation != null) {
        return lastKnownLocation;
      }
    }
    return null;
  }

  static Future<String?> getCountryName() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    var first = placeMarks.first;
    print(first.country);
    return first.country;
  }
}
