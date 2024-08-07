import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? uid;
  final String? email;
  final String? displayName;

  const AuthEntity({
    this.uid,
    this.email,
    this.displayName,
  });

  @override
  List<Object?> get props => [uid];
}
