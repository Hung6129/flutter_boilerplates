part of 'splash_bloc.dart';

abstract class SplashEvent extends BaseEvent {
  const SplashEvent();
}

final class InitSplashEvent extends SplashEvent {
  const InitSplashEvent();
}
