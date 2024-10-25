import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplates/core/data/model/params/authenticate_params.dart';
import 'package:flutter_boilerplates/core/networks/nets/app_result.dart';
import 'package:flutter_boilerplates/features/authenticate/domain/entities/user_entity.dart';
import 'package:flutter_boilerplates/features/authenticate/domain/usecases/authenticate_usecase.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final AuthenticateUsecase authenticateUsecase;

  AuthenticateBloc({
    required this.authenticateUsecase,
  }) : super(const AuthenticateState()) {
    on<SignInWithEmailAndPassword>(_onSignInWithEmailAndPassword);

    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);

    on<Logout>(_onLogout);
  }

  void _onLogout(
    Logout event,
    Emitter<AuthenticateState> emit,
  ) async {
    emit(state.copyWith(status: AuthenticateStatus.loading));
  }

  void _onSignInWithEmailAndPassword(
    SignInWithEmailAndPassword event,
    Emitter<AuthenticateState> emit,
  ) async {
    emit(state.copyWith(status: AuthenticateStatus.loading));
    if (event.params.isEmpty()) {
      return emit(const AuthenticateState.failure(
          'Email and password must not be empty'));
    }
    try {
      final result = await authenticateUsecase.signIn(params: event.params);
      if (result is AppResultSuccess<UserEntity>) {
        return emit(AuthenticateState.success(result.netData!));
      } else if (result is AppResultFailure) {
        return emit(const AuthenticateState.failure('Sign in failed'));
      }
    } catch (e) {
      return emit(const AuthenticateState.failure('Sign in failed'));
    }
  }

  void _onSignUpWithEmailAndPassword(
    SignUpWithEmailAndPassword event,
    Emitter<AuthenticateState> emit,
  ) async {}
}
