import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_application/features/auth/domain/entities/auth.entity.dart';

part 'state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial;
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.data(AuthEntity? data) = _AuthStateData;
  const factory AuthState.error({String? error}) = _AuthStateError;
}
