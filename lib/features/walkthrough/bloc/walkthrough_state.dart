// ignore_for_file: must_be_immutable

part of 'walkthrough_bloc.dart';

enum WalkThroughStatus { initial, loading, completed }

class WalkthroughState extends Equatable {
  WalkThroughStatus status;
  WalkthroughState({
    this.status = WalkThroughStatus.initial,
  });

  WalkthroughState copyWith({
    WalkThroughStatus? status,
  }) {
    return WalkthroughState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
