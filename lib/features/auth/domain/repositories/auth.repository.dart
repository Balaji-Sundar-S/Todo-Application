import 'package:either_dart/either.dart';
import 'package:todo_application/core/errors/failure.dart';
import 'package:todo_application/features/auth/domain/entities/auth.entity.dart';
import 'package:todo_application/core/params/params.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> signIn(Params params);
  Future<Either<Failure, AuthEntity>> signUp(Params params);
  Future<Either<Failure, void>> signOut();
}
