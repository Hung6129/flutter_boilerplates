import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_core_modules/i_core_modules.dart';
import 'package:injectable/injectable.dart';

part 'home_bloc.g.dart';
part 'home_event.dart';
part 'home_state.dart';

@LazySingleton()
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.init()) {
    on<InitHomeEvent>(_onInitHome);
  }

  FutureOr<void> _onInitHome(
      InitHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: BaseStateEnums.processing));
    await Future.delayed(const Duration(seconds: 3));
    emit(
      state.copyWith(
        status: BaseStateEnums.success,
        data: const HomeStateData(
          homeBanner: "Welcome to Home Page",
        ),
      ),
    );
  }
}
