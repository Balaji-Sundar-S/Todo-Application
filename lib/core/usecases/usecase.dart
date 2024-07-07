import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_application/core/errors/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UsecaseWithoutFuture<Type, Params> {
  Either<Failure, Type> call(Params params);
}

// abstract class AuthUsecaseAuthstate<Type> {
//   Stream<Either<Failure, Type>> call();
// }

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
