// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SplashStateCWProxy {
  SplashState status(BaseStateEnums status);

  SplashState data(SplashStateData? data);

  SplashState message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SplashState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SplashState(...).copyWith(id: 12, name: "My name")
  /// ````
  SplashState call({
    BaseStateEnums? status,
    SplashStateData? data,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSplashState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSplashState.copyWith.fieldName(...)`
class _$SplashStateCWProxyImpl implements _$SplashStateCWProxy {
  const _$SplashStateCWProxyImpl(this._value);

  final SplashState _value;

  @override
  SplashState status(BaseStateEnums status) => this(status: status);

  @override
  SplashState data(SplashStateData? data) => this(data: data);

  @override
  SplashState message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SplashState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SplashState(...).copyWith(id: 12, name: "My name")
  /// ````
  SplashState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return SplashState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateEnums,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as SplashStateData?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $SplashStateCopyWith on SplashState {
  /// Returns a callable class that can be used as follows: `instanceOfSplashState.copyWith(...)` or like so:`instanceOfSplashState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SplashStateCWProxy get copyWith => _$SplashStateCWProxyImpl(this);
}
