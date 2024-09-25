import 'package:get/get.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';

/// UserPermission Interface
abstract class ReachabilityService {
  static bool offlineModeEnabled = false;

  /// Network reachability
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
  // ignore: non_constant_identifier_names
  int MAX_RETRY_TIMES = 1;
  int retryConnectingTimes = 0;
  bool wasSkippedForOnlineAgain = false;
  bool wasKeptInOfflineMode = false;
  bool isShowingWarningOfflineDialog = false;
  bool isShowingWarningOnlineDialog = false;

  Rx<ReachabilityStatus> reachabilityStatus =
      Rx(ReachabilityStatus.retryConnecting);
  late FlutterNetworkConnectivity networkConnectivity;

  @override
  void onInit() {
    reachabilityStatus.value = ReachabilityStatus.retryConnecting;
    networkConnectivity = FlutterNetworkConnectivity(
      isContinousLookUp: true,
      lookUpDuration: const Duration(seconds: 6),
    );
    networkConnectivity
        .getInternetAvailabilityStream()
        .listen((isInternetAvailable) {
      if (ReachabilityService.offlineModeEnabled) {
        if (isInternetAvailable) {
          reachabilityStatus.value = ReachabilityStatus.online;
          // reset offline configs
          retryConnectingTimes = 0;
          wasKeptInOfflineMode = false;
          if (!isAppOnlineMode()) {
            showWarningForRetryConnection();
          }
        } else {
          if (retryConnectingTimes < MAX_RETRY_TIMES) {
            reachabilityStatus.value = ReachabilityStatus.retryConnecting;
            retryConnectingTimes += 1;
          } else {
            reachabilityStatus.value = ReachabilityStatus.offline;
            if (isAppOnlineMode()) {
              showWarningForOfflineMode();
            }
          }
        }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    networkConnectivity.unregisterAvailabilityListener();
    super.onClose();
  }

  @override
  bool isConnectingNetwork() {
    if (!ReachabilityService.offlineModeEnabled) return false;
    return reachabilityStatus.value == ReachabilityStatus.retryConnecting;
  }

  @override
  bool isAppOnlineMode() {
    if (!ReachabilityService.offlineModeEnabled) return true;
    return appConnectionMode_ == AppConnectionMode.online;
  }

  @override
  RxBool isOnlineNetwork() {
    if (!ReachabilityService.offlineModeEnabled) return true.obs;
    return (reachabilityStatus.value == ReachabilityStatus.online).obs;
  }

  @override
  Future<void> initConnectionReachability() async {
    // get init connection status
    if (ReachabilityService.offlineModeEnabled) {
      reachabilityStatus.value =
          (await networkConnectivity.isInternetConnectionAvailable())
              ? ReachabilityStatus.online
              : ReachabilityStatus.offline;
      appConnectionMode_ = isOnlineNetwork().value
          ? AppConnectionMode.online
          : AppConnectionMode.online;
      // keep observe connection status
      try {
        networkConnectivity.registerAvailabilityListener();
      } catch (_) {}
    }

    return Future.value();
  }

  @override
  void showWarningForOfflineMode({bool forceShow = false}) {
    if (!ReachabilityService.offlineModeEnabled) return;
    if (!forceShow) {
      if (wasKeptInOfflineMode) return;
    }

    if (isShowingWarningOfflineDialog) return;
    isShowingWarningOfflineDialog = true;
    // DialogUtil.onDialogConfirm(Get.context,
    //     title: Strings.noInternetConnection,
    //     subText: Strings.noInternetConnectionRetryDescription,
    //     onPositiveFunc: () {
    //   isShowingWarningOfflineDialog = false;
    //   Get.back();
    //   // check: logged in before => offline mode ; otherwise go back to login
    // }, onNegativeFunc: () {
    //   isShowingWarningOfflineDialog = false;
    //   wasKeptInOfflineMode = true;
    //   Get.back();
    // });
  }

  @override
  void showWarningForRetryConnection({bool forceShow = false}) {
    if (!ReachabilityService.offlineModeEnabled) return;
    if (!forceShow) {
      if (wasSkippedForOnlineAgain) return;
    }

    if (isShowingWarningOnlineDialog) return;
    if (isShowingWarningOfflineDialog) Get.back();
    isShowingWarningOnlineDialog = true;
    // DialogUtil.onDialogConfirm(Get.context,
    //     title: Strings.hasInternetConnection,
    //     subText: Strings.hasInternetConnectionDescription,
    //     onPositiveFunc: () {
    //   isShowingWarningOnlineDialog = false;
    //   Get.back();
    //   didGoBackOnlineMode();
    // }, onNegativeFunc: () {
    //   isShowingWarningOnlineDialog = false;
    //   wasSkippedForOnlineAgain = true;
    //   Get.back();
    // });
  }

  void didGoToOfflineMode() {
    if (!ReachabilityService.offlineModeEnabled) return;
    appConnectionMode_ = AppConnectionMode.offline;
    // Get.offAllNamed(Routes.homeOffline);
  }

  void didGoBackOnlineMode() {
    if (!ReachabilityService.offlineModeEnabled) return;
    appConnectionMode_ = AppConnectionMode.online;
    // Get.offAllNamed(Routes.walkthrough);
  }
}
