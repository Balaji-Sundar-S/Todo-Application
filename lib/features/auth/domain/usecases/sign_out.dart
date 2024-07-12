import 'package:either_dart/either.dart';
import 'package:DoNow/core/errors/failure.dart';
import 'package:DoNow/core/usecases/usecase.dart';
import 'package:DoNow/features/auth/domain/repositories/auth.repository.dart';

class SignOut extends Usecase<void, NoParams> {
  final AuthRepository _authRepository;

  SignOut({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _authRepository.signOut();
  }
}
