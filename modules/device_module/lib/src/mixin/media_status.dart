import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

enum Status {
  /// The user denied access to the requested feature, permission needs to be
  /// asked first.
  denied,

  /// The user granted access to the requested feature.
  granted,

  /// The OS denied access to the requested feature. The user cannot change
  /// this app's status, possibly due to active restrictions such as parental
  /// controls being in place.
  ///
  /// *Only supported on iOS.*
  restricted,

  /// The user has authorized this application for limited access. So far this
  /// is only relevant for the Photo Library picker.
  ///
  /// *Only supported on iOS (iOS14+).*
  limited,

  /// Permission to the requested feature is permanently denied, the permission
  /// dialog will not be shown when requesting this permission. The user may
  /// still change the permission status in the settings.
  ///
  /// *On Android:*
  /// Android 11+ (API 30+): whether the user denied the permission for a second
  /// time.
  /// Below Android 11 (API 30): whether the user denied access to the requested
  /// feature and selected to never again show a request.
  ///
  /// *On iOS:*
  /// If the user has denied access to the requested feature.
  permanentlyDenied,

  /// The application is provisionally authorized to post non-interruptive user
  /// notifications.
  ///
  /// *Only supported on iOS (iOS12+).*
  provisional,
}

enum MediaStateType {
  init,
  processing,
  optimizing,
  calculatingLength,
  successful
}

@LazySingleton()
final class MediaState {
  static final MediaState instance = MediaState._internal();

  final ValueNotifier<MediaStateType> _mediaStateNotifier;
  MediaState._internal() : _mediaStateNotifier = ValueNotifier(MediaStateType.init);

  void updateMediaState(MediaStateType state) {
    _mediaStateNotifier.value = state;
    // onMediaStateChanged(state);
  }

  void initMediaState() => _mediaStateNotifier.value = MediaStateType.init;

  ValueNotifier<MediaStateType> get mediaStateNotifier => _mediaStateNotifier;
}