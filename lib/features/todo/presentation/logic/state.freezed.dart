// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodoEntity>? data) data,
    required TResult Function(String? error) error,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TodoEntity>? data)? data,
    TResult? Function(String? error)? error,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TodoEntity>? data)? data,
    TResult Function(String? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateData value) data,
    required TResult Function(_TodoStateError value) error,
    required TResult Function(_TodoStateEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateData value)? data,
    TResult? Function(_TodoStateError value)? error,
    TResult? Function(_TodoStateEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateData value)? data,
    TResult Function(_TodoStateError value)? error,
    TResult Function(_TodoStateEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TodoStateInitialImplCopyWith<$Res> {
  factory _$$TodoStateInitialImplCopyWith(_$TodoStateInitialImpl value,
          $Res Function(_$TodoStateInitialImpl) then) =
      __$$TodoStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoStateInitialImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateInitialImpl>
    implements _$$TodoStateInitialImplCopyWith<$Res> {
  __$$TodoStateInitialImplCopyWithImpl(_$TodoStateInitialImpl _value,
      $Res Function(_$TodoStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TodoStateInitialImpl implements _TodoStateInitial {
  const _$TodoStateInitialImpl();

  @override
  String toString() {
    return 'TodoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodoEntity>? data) data,
    required TResult Function(String? error) error,
    required TResult Function() empty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TodoEntity>? data)? data,
    TResult? Function(String? error)? error,
    TResult? Function()? empty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TodoEntity>? data)? data,
    TResult Function(String? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateData value) data,
    required TResult Function(_TodoStateError value) error,
    required TResult Function(_TodoStateEmpty value) empty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateData value)? data,
    TResult? Function(_TodoStateError value)? error,
    TResult? Function(_TodoStateEmpty value)? empty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateData value)? data,
    TResult Function(_TodoStateError value)? error,
    TResult Function(_TodoStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TodoStateInitial implements TodoState {
  const factory _TodoStateInitial() = _$TodoStateInitialImpl;
}

/// @nodoc
abstract class _$$TodoStateLoadingImplCopyWith<$Res> {
  factory _$$TodoStateLoadingImplCopyWith(_$TodoStateLoadingImpl value,
          $Res Function(_$TodoStateLoadingImpl) then) =
      __$$TodoStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoStateLoadingImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateLoadingImpl>
    implements _$$TodoStateLoadingImplCopyWith<$Res> {
  __$$TodoStateLoadingImplCopyWithImpl(_$TodoStateLoadingImpl _value,
      $Res Function(_$TodoStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TodoStateLoadingImpl implements _TodoStateLoading {
  const _$TodoStateLoadingImpl();

  @override
  String toString() {
    return 'TodoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodoEntity>? data) data,
    required TResult Function(String? error) error,
    required TResult Function() empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TodoEntity>? data)? data,
    TResult? Function(String? error)? error,
    TResult? Function()? empty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TodoEntity>? data)? data,
    TResult Function(String? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateData value) data,
    required TResult Function(_TodoStateError value) error,
    required TResult Function(_TodoStateEmpty value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateData value)? data,
    TResult? Function(_TodoStateError value)? error,
    TResult? Function(_TodoStateEmpty value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateData value)? data,
    TResult Function(_TodoStateError value)? error,
    TResult Function(_TodoStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TodoStateLoading implements TodoState {
  const factory _TodoStateLoading() = _$TodoStateLoadingImpl;
}

/// @nodoc
abstract class _$$TodoStateDataImplCopyWith<$Res> {
  factory _$$TodoStateDataImplCopyWith(
          _$TodoStateDataImpl value, $Res Function(_$TodoStateDataImpl) then) =
      __$$TodoStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TodoEntity>? data});
}

/// @nodoc
class __$$TodoStateDataImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateDataImpl>
    implements _$$TodoStateDataImplCopyWith<$Res> {
  __$$TodoStateDataImplCopyWithImpl(
      _$TodoStateDataImpl _value, $Res Function(_$TodoStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$TodoStateDataImpl(
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TodoEntity>?,
    ));
  }
}

/// @nodoc

class _$TodoStateDataImpl implements _TodoStateData {
  const _$TodoStateDataImpl(final List<TodoEntity>? data) : _data = data;

  final List<TodoEntity>? _data;
  @override
  List<TodoEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TodoState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateDataImplCopyWith<_$TodoStateDataImpl> get copyWith =>
      __$$TodoStateDataImplCopyWithImpl<_$TodoStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodoEntity>? data) data,
    required TResult Function(String? error) error,
    required TResult Function() empty,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TodoEntity>? data)? data,
    TResult? Function(String? error)? error,
    TResult? Function()? empty,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TodoEntity>? data)? data,
    TResult Function(String? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateData value) data,
    required TResult Function(_TodoStateError value) error,
    required TResult Function(_TodoStateEmpty value) empty,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateData value)? data,
    TResult? Function(_TodoStateError value)? error,
    TResult? Function(_TodoStateEmpty value)? empty,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateData value)? data,
    TResult Function(_TodoStateError value)? error,
    TResult Function(_TodoStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _TodoStateData implements TodoState {
  const factory _TodoStateData(final List<TodoEntity>? data) =
      _$TodoStateDataImpl;

  List<TodoEntity>? get data;
  @JsonKey(ignore: true)
  _$$TodoStateDataImplCopyWith<_$TodoStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodoStateErrorImplCopyWith<$Res> {
  factory _$$TodoStateErrorImplCopyWith(_$TodoStateErrorImpl value,
          $Res Function(_$TodoStateErrorImpl) then) =
      __$$TodoStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$TodoStateErrorImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateErrorImpl>
    implements _$$TodoStateErrorImplCopyWith<$Res> {
  __$$TodoStateErrorImplCopyWithImpl(
      _$TodoStateErrorImpl _value, $Res Function(_$TodoStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$TodoStateErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TodoStateErrorImpl implements _TodoStateError {
  const _$TodoStateErrorImpl({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'TodoState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoStateErrorImplCopyWith<_$TodoStateErrorImpl> get copyWith =>
      __$$TodoStateErrorImplCopyWithImpl<_$TodoStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodoEntity>? data) data,
    required TResult Function(String? error) error,
    required TResult Function() empty,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TodoEntity>? data)? data,
    TResult? Function(String? error)? error,
    TResult? Function()? empty,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TodoEntity>? data)? data,
    TResult Function(String? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateData value) data,
    required TResult Function(_TodoStateError value) error,
    required TResult Function(_TodoStateEmpty value) empty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateData value)? data,
    TResult? Function(_TodoStateError value)? error,
    TResult? Function(_TodoStateEmpty value)? empty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateData value)? data,
    TResult Function(_TodoStateError value)? error,
    TResult Function(_TodoStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _TodoStateError implements TodoState {
  const factory _TodoStateError({final String? error}) = _$TodoStateErrorImpl;

  String? get error;
  @JsonKey(ignore: true)
  _$$TodoStateErrorImplCopyWith<_$TodoStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodoStateEmptyImplCopyWith<$Res> {
  factory _$$TodoStateEmptyImplCopyWith(_$TodoStateEmptyImpl value,
          $Res Function(_$TodoStateEmptyImpl) then) =
      __$$TodoStateEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoStateEmptyImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoStateEmptyImpl>
    implements _$$TodoStateEmptyImplCopyWith<$Res> {
  __$$TodoStateEmptyImplCopyWithImpl(
      _$TodoStateEmptyImpl _value, $Res Function(_$TodoStateEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TodoStateEmptyImpl implements _TodoStateEmpty {
  const _$TodoStateEmptyImpl();

  @override
  String toString() {
    return 'TodoState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoStateEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodoEntity>? data) data,
    required TResult Function(String? error) error,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TodoEntity>? data)? data,
    TResult? Function(String? error)? error,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TodoEntity>? data)? data,
    TResult Function(String? error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoStateInitial value) initial,
    required TResult Function(_TodoStateLoading value) loading,
    required TResult Function(_TodoStateData value) data,
    required TResult Function(_TodoStateError value) error,
    required TResult Function(_TodoStateEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TodoStateInitial value)? initial,
    TResult? Function(_TodoStateLoading value)? loading,
    TResult? Function(_TodoStateData value)? data,
    TResult? Function(_TodoStateError value)? error,
    TResult? Function(_TodoStateEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoStateInitial value)? initial,
    TResult Function(_TodoStateLoading value)? loading,
    TResult Function(_TodoStateData value)? data,
    TResult Function(_TodoStateError value)? error,
    TResult Function(_TodoStateEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _TodoStateEmpty implements TodoState {
  const factory _TodoStateEmpty() = _$TodoStateEmptyImpl;
}
