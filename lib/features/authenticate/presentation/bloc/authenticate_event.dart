part of 'authenticate_bloc.dart';

abstract class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();

  @override
  List<Object> get props => [];
}

class Logout extends AuthenticateEvent {}

class SignInWithEmailAndPassword extends AuthenticateEvent {
  final SignInParams params;

  const SignInWithEmailAndPassword({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}

class SignUpWithEmailAndPassword extends AuthenticateEvent {
  final SignUpParams params;

  const SignUpWithEmailAndPassword({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}
