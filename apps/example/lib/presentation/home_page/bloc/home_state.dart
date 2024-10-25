// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@CopyWith()
class HomeState extends BaseBlocState<HomeStateData?> {
  const HomeState({required super.status, super.data, super.message});

  factory HomeState.init() => const HomeState(status: BaseStateEnums.init);
}

@CopyWith()
class HomeStateData extends Equatable {
  final String homeBanner;
  const HomeStateData({
    this.homeBanner = "Bruh...",
  });

  @override
  List<Object?> get props => [homeBanner];
}
