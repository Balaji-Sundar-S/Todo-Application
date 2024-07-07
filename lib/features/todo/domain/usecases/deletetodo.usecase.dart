import 'package:either_dart/either.dart';
import 'package:todo_application/core/errors/failure.dart';
import 'package:todo_application/core/params/params.dart';
import 'package:todo_application/core/usecases/usecase.dart';
import 'package:todo_application/features/todo/domain/repository/todo.repository.dart';

class DeletetodoUsecase extends Usecase<void, Params> {
  final TodoRepository _todoRepository;

  DeletetodoUsecase({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;
  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await _todoRepository.deleteTodo(params);
  }
}
