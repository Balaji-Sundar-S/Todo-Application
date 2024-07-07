import 'package:either_dart/either.dart';
import 'package:todo_application/core/errors/failure.dart';
import 'package:todo_application/core/usecases/usecase.dart';
import 'package:todo_application/features/auth/domain/entities/auth.entity.dart';
import 'package:todo_application/core/params/params.dart';
import 'package:todo_application/features/auth/domain/repositories/auth.repository.dart';

class SignIn extends Usecase<AuthEntity, Params> {
  final AuthRepository _authRepository;

  SignIn({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, AuthEntity>> call(Params params) async {
    return await _authRepository.signIn(params);
  }
}
