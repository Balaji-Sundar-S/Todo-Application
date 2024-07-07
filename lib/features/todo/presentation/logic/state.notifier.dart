import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/core/params/params.dart';
import 'package:todo_application/features/todo/domain/usecases/addtodo.usecase.dart';
import 'package:todo_application/features/todo/domain/usecases/deletetodo.usecase.dart';
import 'package:todo_application/features/todo/domain/usecases/gettodo.usecase.dart';
import 'package:todo_application/features/todo/domain/usecases/updatetodo.usecase.dart';
import 'package:todo_application/features/todo/presentation/logic/state.dart';

class TodoStateNotifier extends StateNotifier<TodoState> {
  final AddtodoUsecase addtodoUsecase;
  final DeletetodoUsecase deletetodoUsecase;
  final GettodoUsecase gettodoUsecase;
  final UpdatetodoUsecase updatetodoUsecase;

  TodoStateNotifier(
      {required this.addtodoUsecase,
      required this.deletetodoUsecase,
      required this.gettodoUsecase,
      required this.updatetodoUsecase})
      : super(
          const TodoState.initial(),
        );

  Future<void> loadTodos(Params params) async {
    state = const TodoState.loading();
    var data = await gettodoUsecase.call(params);
    data.fold(
      (l) => state = TodoState.error(error: l.msg),
      (r) => state = TodoState.data(r),
    );
  }

  Future<void> addTodos(Params params) async {
    state = const TodoState.loading();
    var data = await addtodoUsecase.call(params);
    data.fold(
      (l) => state = TodoState.error(error: l.msg),
      (r) => state = const TodoState.data(null),
    );
  }

  Future<void> updateTodos(Params params) async {
    state = const TodoState.loading();
    var data = await updatetodoUsecase.call(params);
    data.fold(
      (l) => state = TodoState.error(error: l.msg),
      (r) => state = const TodoState.data(null),
    );
  }

  Future<void> deleteTodos(Params params) async {
    state = const TodoState.loading();
    var data = await deletetodoUsecase.call(params);
    data.fold(
      (l) => state = TodoState.error(error: l.msg),
      (r) => state = const TodoState.data(null),
    );
  }
}
