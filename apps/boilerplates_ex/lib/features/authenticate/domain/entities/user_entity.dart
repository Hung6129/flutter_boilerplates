import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;

  const UserEntity({
    required this.id,
  });

  static const empty = UserEntity(
    id: '',
  );

  @override
  List<Object?> get props => [id];
}
