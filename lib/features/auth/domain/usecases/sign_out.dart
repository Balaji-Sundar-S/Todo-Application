import 'package:either_dart/either.dart';
import 'package:todo_application/core/errors/failure.dart';
import 'package:todo_application/core/usecases/usecase.dart';
import 'package:todo_application/features/auth/domain/repositories/auth.repository.dart';

class SignOut extends Usecase<void, NoParams> {
  final AuthRepository _authRepository;

  SignOut({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _authRepository.signOut();
  }
}
