import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DoNow/core/errors/failure.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/features/todo/data/remote%20datasource/todo.remotedatasource.dart';
import 'package:DoNow/features/todo/domain/entities/todo.entity.dart';
import 'package:DoNow/features/todo/domain/repository/todo.repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatasource _todoRemoteDatasource;

  TodoRepositoryImpl({required TodoRemoteDatasource todoRemoteDatasource})
      : _todoRemoteDatasource = todoRemoteDatasource;

  @override
  Future<Either<Failure, void>> addTodo(Params params) async {
    try {
      var data = await _todoRemoteDatasource.addTodo(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(msg: e.toString()));
    } catch (e) {
      return Left(InternalFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(Params params) async {
    try {
      await _todoRemoteDatasource.deleteTodo(params);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(msg: e.toString()));
    } catch (e) {
      return Left(InternalFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodo(Params params) async {
    try {
      var data = await _todoRemoteDatasource.getTodo(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(msg: e.toString()));
    } catch (e) {
      return Left(InternalFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTodo(Params params) async {
    try {
      var data = await _todoRemoteDatasource.updateTodo(params);
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(msg: e.toString()));
    } catch (e) {
      return Left(InternalFailure(msg: e.toString()));
    }
  }
}
