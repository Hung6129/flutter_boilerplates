import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// UserPermission Interface
abstract class ReachabilityService {
  Future<dynamic> initConnectionReachability();

  RxBool isOnlineNetwork();

  bool isConnectingNetwork();

  /// App offline mode handling
  bool isAppOnlineMode();

  void showWarningForOfflineMode({bool forceShow});

  void showWarningForRetryConnection({bool forceShow});
}

enum ReachabilityStatus {
  online,
  offline,
  retryConnecting,
}

enum AppConnectionMode {
  online,
  offline,
}

AppConnectionMode appConnectionMode_ = AppConnectionMode.online;

class ReachabilityServiceImpl extends GetxService
    implements ReachabilityService {
  int MAX_RETRY_TIMES = 1;
  int retryConnectingTimes = 0;
  bool wasSkippedForOnlineAgain = false;
  bool wasKeptInOfflineMode = false;
  bool isShowingWarningOfflineDialog = false;
  bool isShowingWarningOnlineDialog = false;

  Rx<ReachabilityStatus> reachabilityStatus =
      Rx(ReachabilityStatus.retryConnecting);

  final _connectionStatus = [ConnectivityResult.none].obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  set connectionStatus(value) {
    _connectionStatus.value = value;
  }

  @override
  void onInit() async {
    getConnectivityType();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    super.onInit();
  }

  Future<void> getConnectivityType() async {
    late List<ConnectivityResult> connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      debugPrint('PlatformException: ${e.toString()}');
    }
    return _updateState(connectivityResult);
  }

  _updateState(List<ConnectivityResult> result) {
    switch (result.first) {
      case ConnectivityResult.wifi:
        connectionStatus = [ConnectivityResult.wifi];
        reachabilityStatus.value = ReachabilityStatus.online;
        break;
      case ConnectivityResult.mobile:
        connectionStatus = [ConnectivityResult.mobile];
        reachabilityStatus.value = ReachabilityStatus.online;
        break;
      case ConnectivityResult.none:
        connectionStatus = [ConnectivityResult.none];
        reachabilityStatus.value = ReachabilityStatus.offline;
        break;
      default:
        debugPrint('ConnectivityResult: ${result.first}');
        break;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
  }

  @override
  bool isConnectingNetwork() {
    return reachabilityStatus.value == ReachabilityStatus.retryConnecting;
  }

  @override
  bool isAppOnlineMode() {
    return appConnectionMode_ == AppConnectionMode.online;
  }

  @override
  RxBool isOnlineNetwork() {
    return (reachabilityStatus.value == ReachabilityStatus.online).obs;
  }

  @override
  Future<void> initConnectionReachability() async {
    if (isConnectingNetwork()) return;
    if (isAppOnlineMode()) return;
    if (reachabilityStatus.value == ReachabilityStatus.online) {
      didGoBackOnlineMode();
    } else {
      didGoToOfflineMode();
    }
  }

  @override
  void showWarningForOfflineMode({bool forceShow = false}) {
    // if (!ReachabilityService.offlineModeEnabled) return;
    // if (!forceShow) {
    //   if (wasKeptInOfflineMode) return;
    // }

    // if (isShowingWarningOfflineDialog) return;
    // isShowingWarningOfflineDialog = true;
    // // DialogUtil.onDialogConfirm(Get.context,
    // //     title: Strings.noInternetConnection,
    // //     subText: Strings.noInternetConnectionRetryDescription,
    // //     onPositiveFunc: () {
    // //   isShowingWarningOfflineDialog = false;
    // //   Get.back();
    // //   // check: logged in before => offline mode ; otherwise go back to login
    // // }, onNegativeFunc: () {
    // //   isShowingWarningOfflineDialog = false;
    // //   wasKeptInOfflineMode = true;
    // //   Get.back();
    // // });
  }

  @override
  void showWarningForRetryConnection({bool forceShow = false}) {
    // if (!ReachabilityService.offlineModeEnabled) return;
    // if (!forceShow) {
    //   if (wasSkippedForOnlineAgain) return;
    // }

    // if (isShowingWarningOnlineDialog) return;
    // if (isShowingWarningOfflineDialog) Get.back();
    // isShowingWarningOnlineDialog = true;
    // // DialogUtil.onDialogConfirm(Get.context,
    // //     title: Strings.hasInternetConnection,
    // //     subText: Strings.hasInternetConnectionDescription,
    // //     onPositiveFunc: () {
    // //   isShowingWarningOnlineDialog = false;
    // //   Get.back();
    // //   didGoBackOnlineMode();
    // // }, onNegativeFunc: () {
    // //   isShowingWarningOnlineDialog = false;
    // //   wasSkippedForOnlineAgain = true;
    // //   Get.back();
    // // });
  }

  void didGoToOfflineMode() {
    appConnectionMode_ = AppConnectionMode.offline;
    // Get.offAllNamed(Routes.homeOffline);
  }

  void didGoBackOnlineMode() {
    appConnectionMode_ = AppConnectionMode.online;
    // Get.offAllNamed(Routes.walkthrough);
  }
}
