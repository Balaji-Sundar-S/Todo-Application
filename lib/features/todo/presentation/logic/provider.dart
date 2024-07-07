import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/features/todo/data/remote%20datasource/todo.remotedatasource.dart';
import 'package:todo_application/features/todo/data/repositoryimpl/todo.repositoryimpl.dart';
import 'package:todo_application/features/todo/domain/repository/todo.repository.dart';
import 'package:todo_application/features/todo/domain/usecases/addtodo.usecase.dart';
import 'package:todo_application/features/todo/domain/usecases/deletetodo.usecase.dart';
import 'package:todo_application/features/todo/domain/usecases/gettodo.usecase.dart';
import 'package:todo_application/features/todo/domain/usecases/updatetodo.usecase.dart';
import 'package:todo_application/features/todo/presentation/logic/state.dart';
import 'package:todo_application/features/todo/presentation/logic/state.notifier.dart';

final todoRemoteDatasourceProvider = Provider<TodoRemoteDatasource>((ref) {
  return TodoRemoteDatasourceImpl(
      firebaseFirestore: FirebaseFirestore.instance);
});

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepositoryImpl(
      todoRemoteDatasource: ref.read(todoRemoteDatasourceProvider));
});

final todoAddUsecaseProvider = Provider<AddtodoUsecase>((ref) {
  return AddtodoUsecase(todoRepository: ref.read(todoRepositoryProvider));
});

final todoUpdateUsecaseProvider = Provider<UpdatetodoUsecase>((ref) {
  return UpdatetodoUsecase(todoRepository: ref.read(todoRepositoryProvider));
});

final todoGetUsecaseProvider = Provider<GettodoUsecase>((ref) {
  return GettodoUsecase(todoRepository: ref.read(todoRepositoryProvider));
});

final todoDeleteUsecaseProvider = Provider<DeletetodoUsecase>((ref) {
  return DeletetodoUsecase(todoRepository: ref.read(todoRepositoryProvider));
});

final todoNotifierProvider =
    StateNotifierProvider<TodoStateNotifier, TodoState>((ref) {
  return TodoStateNotifier(
    addtodoUsecase: ref.read(todoAddUsecaseProvider),
    deletetodoUsecase: ref.read(todoDeleteUsecaseProvider),
    gettodoUsecase: ref.read(todoGetUsecaseProvider),
    updatetodoUsecase: ref.read(todoUpdateUsecaseProvider),
  );
});
