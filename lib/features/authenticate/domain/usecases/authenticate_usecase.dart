import 'package:flutter_boilerplates/core/data/model/params/authenticate_params.dart';
import 'package:flutter_boilerplates/core/networks/nets/app_result.dart';
import 'package:flutter_boilerplates/features/authenticate/domain/entities/user_entity.dart';

import '../repositories/authenticate_repository.dart';

class AuthenticateUsecase {
  final AuthenticateRepository repository;

  AuthenticateUsecase(this.repository);

  Future<AppResult<UserEntity>> signIn({
    required SignInParams params,
  }) async {
    return await repository.signInWithEmailAndPassword(params: params);
  }

  Future<AppResult<UserEntity>> signUp({
    required SignUpParams params,
  }) async {
    return await repository.signUpWithEmailAndPassword(params: params);
  }
}
