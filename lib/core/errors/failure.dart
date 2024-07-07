import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? msg;

  const Failure({this.msg});

  @override
  List<Object?> get props => [msg];
}

class FirebaseFailure extends Failure {
  const FirebaseFailure({super.msg});
}

class InternalFailure extends Failure {
  const InternalFailure({super.msg});
}
