part of 'splash_bloc.dart';

@CopyWith()
class SplashState extends BaseBlocState<SplashStateData?> {
  const SplashState({required super.status, super.data, super.message});

  factory SplashState.init() => const SplashState(status: BaseStateEnums.init);
}

class SplashStateData extends Equatable {
  final SplashFlowEnum destination;

  const SplashStateData({required this.destination});

  @override
  List<Object?> get props => [];
}

enum SplashFlowEnum {
  goOnboarding,
  goHome,
  goSelectLanguage,
  goLogin,
  goMaintenance,
  goForceUpdate,
}
