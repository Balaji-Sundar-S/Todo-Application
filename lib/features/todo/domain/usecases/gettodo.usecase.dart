import 'package:either_dart/either.dart';
import 'package:todo_application/core/errors/failure.dart';
import 'package:todo_application/core/params/params.dart';
import 'package:todo_application/core/usecases/usecase.dart';
import 'package:todo_application/features/todo/domain/entities/todo.entity.dart';
import 'package:todo_application/features/todo/domain/repository/todo.repository.dart';

class GettodoUsecase extends Usecase<List<TodoEntity>, Params> {
  final TodoRepository _todoRepository;

  GettodoUsecase({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;
  @override
  Future<Either<Failure, List<TodoEntity>>> call(Params params) async {
    return await _todoRepository.getTodo(params);
  }
}
