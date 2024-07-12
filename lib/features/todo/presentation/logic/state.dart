import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:DoNow/features/todo/domain/entities/todo.entity.dart';

part 'state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = _TodoStateInitial;
  const factory TodoState.loading() = _TodoStateLoading;
  const factory TodoState.data(List<TodoEntity>? data) = _TodoStateData;
  const factory TodoState.error({String? error}) = _TodoStateError;
  const factory TodoState.empty() = _TodoStateEmpty;
}
