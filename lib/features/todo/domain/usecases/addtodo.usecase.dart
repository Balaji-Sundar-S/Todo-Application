import 'package:either_dart/either.dart';
import 'package:DoNow/core/errors/failure.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/core/usecases/usecase.dart';
import 'package:DoNow/features/todo/domain/repository/todo.repository.dart';

class AddtodoUsecase extends Usecase<void, Params> {
  final TodoRepository _todoRepository;

  AddtodoUsecase({required TodoRepository todoRepository})
      : _todoRepository = todoRepository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await _todoRepository.addTodo(params);
  }
}
