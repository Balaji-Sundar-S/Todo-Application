import 'package:either_dart/either.dart';
import 'package:DoNow/core/errors/failure.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/core/usecases/usecase.dart';
import 'package:DoNow/features/todo/domain/entities/todo.entity.dart';
import 'package:DoNow/features/todo/domain/repository/todo.repository.dart';

class GettodoUsecase extends Usecase<List<TodoEntity>, Params> {
  final TodoRepository _todoRepository;

  GettodoUsecase({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;
  @override
  Future<Either<Failure, List<TodoEntity>>> call(Params params) async {
    return await _todoRepository.getTodo(params);
  }
}
