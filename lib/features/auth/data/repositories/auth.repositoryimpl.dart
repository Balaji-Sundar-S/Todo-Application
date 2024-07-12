import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DoNow/core/errors/failure.dart';
import 'package:DoNow/features/auth/data/datasources/remote_datasource.dart';
import 'package:DoNow/features/auth/domain/entities/auth.entity.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/features/auth/domain/repositories/auth.repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

  @override
  Future<Either<Failure, AuthEntity>> signIn(Params params) async {
    try {
      var data = await _authDataSource.signIn(params);

      return Right(data);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signUp(Params params) async {
    try {
      var data = await _authDataSource.signUp(params);

      return Right(data);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      var data = await _authDataSource.signOut();

      return Right(data);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure(msg: e.message));
    } catch (e) {
      return Left(InternalFailure(msg: e.toString()));
    }
  }
}
