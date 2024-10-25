import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'walkthrough_event.dart';
part 'walkthrough_state.dart';

class WalkthroughBloc extends Bloc<WalkthroughEvent, WalkthroughState> {
  WalkthroughBloc() : super(WalkthroughState()) {
    on<WalkthroughStarted>(_onWalkthroughStarted);
  }

  void _onWalkthroughStarted(
    WalkthroughStarted event,
    Emitter<WalkthroughState> emit,
  ) async {
    emit(state.copyWith(status: WalkThroughStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: WalkThroughStatus.completed));
  }
}
