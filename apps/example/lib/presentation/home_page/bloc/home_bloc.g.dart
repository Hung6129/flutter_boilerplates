// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState status(BaseStateEnums status);

  HomeState data(HomeStateData? data);

  HomeState message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    BaseStateEnums? status,
    HomeStateData? data,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeState.copyWith.fieldName(...)`
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  const _$HomeStateCWProxyImpl(this._value);

  final HomeState _value;

  @override
  HomeState status(BaseStateEnums status) => this(status: status);

  @override
  HomeState data(HomeStateData? data) => this(data: data);

  @override
  HomeState message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return HomeState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateEnums,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as HomeStateData?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeState.copyWith(...)` or like so:`instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}

abstract class _$HomeStateDataCWProxy {
  HomeStateData homeBanner(String homeBanner);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeStateData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeStateData(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeStateData call({
    String? homeBanner,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeStateData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeStateData.copyWith.fieldName(...)`
class _$HomeStateDataCWProxyImpl implements _$HomeStateDataCWProxy {
  const _$HomeStateDataCWProxyImpl(this._value);

  final HomeStateData _value;

  @override
  HomeStateData homeBanner(String homeBanner) => this(homeBanner: homeBanner);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeStateData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeStateData(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeStateData call({
    Object? homeBanner = const $CopyWithPlaceholder(),
  }) {
    return HomeStateData(
      homeBanner:
          homeBanner == const $CopyWithPlaceholder() || homeBanner == null
              ? _value.homeBanner
              // ignore: cast_nullable_to_non_nullable
              : homeBanner as String,
    );
  }
}

extension $HomeStateDataCopyWith on HomeStateData {
  /// Returns a callable class that can be used as follows: `instanceOfHomeStateData.copyWith(...)` or like so:`instanceOfHomeStateData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateDataCWProxy get copyWith => _$HomeStateDataCWProxyImpl(this);
}
