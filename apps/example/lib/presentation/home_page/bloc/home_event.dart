part of 'home_bloc.dart';

abstract class HomeEvent extends BaseEvent {
  const HomeEvent();
}

class InitHomeEvent extends HomeEvent {
  const InitHomeEvent();
}
