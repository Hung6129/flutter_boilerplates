import 'package:flutter_boilerplates/core/data/model/params/authenticate_params.dart';
import 'package:flutter_boilerplates/core/networks/nets/app_result.dart';
import 'package:flutter_boilerplates/features/authenticate/data/datasoures/authenticate_datasource.dart';
import 'package:flutter_boilerplates/features/authenticate/domain/entities/user_entity.dart';
import 'package:flutter_boilerplates/features/authenticate/domain/repositories/authenticate_repository.dart';

class AuthenticateRepositoryImpl implements AuthenticateRepository {
  final AuthenticateDatasource remoteDataSource;
  AuthenticateRepositoryImpl(
    this.remoteDataSource,
  );
  @override
  Future<AppResult<UserEntity>> signInWithEmailAndPassword(
      {required SignInParams params}) async {
    return await remoteDataSource.signInWithEmailAndPassword(params: params);
  }

  @override
  Future<AppResult<UserEntity>> signUpWithEmailAndPassword(
      {required SignUpParams params}) async {
    return await remoteDataSource.signUpWithEmailAndPassword(params: params);
  }
}
