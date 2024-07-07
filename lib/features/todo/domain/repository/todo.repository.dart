import 'package:either_dart/either.dart';
import 'package:todo_application/core/errors/failure.dart';
import 'package:todo_application/core/params/params.dart';
import 'package:todo_application/features/todo/domain/entities/todo.entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, void>> addTodo(Params params);
  Future<Either<Failure, void>> updateTodo(Params params);
  Future<Either<Failure, void>> deleteTodo(Params params);
  Future<Either<Failure, List<TodoEntity>>> getTodo(Params params);
}
