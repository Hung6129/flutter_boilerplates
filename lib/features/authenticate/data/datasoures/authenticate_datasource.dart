import 'package:flutter_boilerplates/core/data/model/params/authenticate_params.dart';
import 'package:flutter_boilerplates/core/networks/nets/app_result.dart';
import 'package:flutter_boilerplates/features/authenticate/data/models/user_model.dart';
import 'package:uuid/uuid.dart';

abstract class AuthenticateDatasource {
  Future<AppResult<UserModel>> signInWithEmailAndPassword({
    required SignInParams params,
  });

  Future<AppResult<UserModel>> signUpWithEmailAndPassword({
    required SignUpParams params,
  });
}

class AuthenticateDatasourceImpl implements AuthenticateDatasource {
  @override
  Future<AppResult<UserModel>> signInWithEmailAndPassword({
    required SignInParams params,
  }) async {
    var uuid = const Uuid();
    await Future.delayed(const Duration(seconds: 1));
    return AppResult.success(UserModel(id: uuid.v4()));
  }

  @override
  Future<AppResult<UserModel>> signUpWithEmailAndPassword({
    required SignUpParams params,
  }) async {
    var uuid = const Uuid();
    await Future.delayed(const Duration(seconds: 1));
    return AppResult.success(UserModel(id: uuid.v4()));
  }
}
