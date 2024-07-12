import 'package:either_dart/either.dart';
import 'package:DoNow/core/errors/failure.dart';
import 'package:DoNow/core/usecases/usecase.dart';
import 'package:DoNow/features/auth/domain/entities/auth.entity.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/features/auth/domain/repositories/auth.repository.dart';

class SignUp extends Usecase<AuthEntity, Params> {
  final AuthRepository _authRepository;

  SignUp({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, AuthEntity>> call(Params params) async {
    return await _authRepository.signUp(params);
  }
}
