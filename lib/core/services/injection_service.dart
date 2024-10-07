import 'package:flutter_boilerplates/core/networks/network_service.dart';
import 'package:flutter_boilerplates/features/authenticate/data/datasoures/authenticate_datasource.dart';
import 'package:flutter_boilerplates/features/authenticate/data/repositories/authenticate_repository_impl.dart';
import 'package:flutter_boilerplates/features/authenticate/domain/repositories/authenticate_repository.dart';
import 'package:flutter_boilerplates/features/authenticate/domain/usecases/authenticate_usecase.dart';
import 'package:flutter_boilerplates/features/authenticate/presentation/bloc/authenticate_bloc.dart';
import 'package:flutter_boilerplates/features/walkthrough/bloc/walkthrough_bloc.dart';
import 'package:get_it/get_it.dart';

final iS = GetIt.instance;

class InjectionService {
  static void registerServices() {
    // Todo: Register all the services here
    iS.registerSingleton<NetworkService>(NetworkServiceImpl());

    // Todo: Register all the datasources here
    iS.registerLazySingleton<AuthenticateDatasource>(
        () => AuthenticateDatasourceImpl());

    // Todo: Register all the repositories here
    iS.registerLazySingleton<AuthenticateRepository>(
      () => AuthenticateRepositoryImpl(iS()),
    );

    // Todo: Register all the usecases here
    iS.registerFactory<AuthenticateUsecase>(
      () => AuthenticateUsecase(iS()),
    );

    // Todo: Register all the blocs here
    iS.registerFactory<WalkthroughBloc>(
      () => WalkthroughBloc(),
    );
    iS.registerFactory<AuthenticateBloc>(
      () => AuthenticateBloc(
        authenticateUsecase: iS(),
      ),
    );
  }
}
