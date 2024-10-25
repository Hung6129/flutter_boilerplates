part of 'authenticate_bloc.dart';

enum AuthenticateStatus {
  initial,
  loading,
  success,
  failure,
}

class AuthenticateState extends Equatable {
  final AuthenticateStatus status;
  final UserEntity user;
  final String errorMessage;

  const AuthenticateState({
    this.status = AuthenticateStatus.initial,
    this.user = UserEntity.empty,
    this.errorMessage = '',
  });

  const AuthenticateState.failure(String message)
      : this(
          status: AuthenticateStatus.failure,
          user: UserEntity.empty,
          errorMessage: message,
        );

  const AuthenticateState.success(UserEntity user)
      : this(
          status: AuthenticateStatus.success,
          user: user,
          errorMessage: '',
        );

  AuthenticateState copyWith({
    AuthenticateStatus? status,
    UserEntity? user,
    String? errorMessage,
  }) {
    return AuthenticateState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        user,
        errorMessage,
      ];
}
