import 'package:flutter_boilerplates/core/data/model/params/authenticate_params.dart';
import 'package:flutter_boilerplates/core/networks/nets/app_result.dart';

import '../entities/user_entity.dart';

abstract class AuthenticateRepository {
  Future<AppResult<UserEntity>> signInWithEmailAndPassword({
    required SignInParams params,
  });

  Future<AppResult<UserEntity>> signUpWithEmailAndPassword({
    required SignUpParams params,
  });
}
