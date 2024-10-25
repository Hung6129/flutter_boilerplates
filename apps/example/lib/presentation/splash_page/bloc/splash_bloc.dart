import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:example/app/services/app_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_core_modules/i_core_modules.dart';
import 'package:injectable/injectable.dart';

part 'splash_bloc.g.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@LazySingleton()
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  final AppService appService;
  SplashBloc(
    this.appService,
  ) : super(SplashState.init()) {
    on<InitSplashEvent>(_onInitSplash);
  }

  FutureOr<void> _onInitSplash(
      InitSplashEvent event, Emitter<SplashState> emit) async {
    emit(state.copyWith.status(BaseStateEnums.processing));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith.status(BaseStateEnums.success));
  }
}
