import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final String? uid;
  final String? email;
  final String? userName;
  final String? password;
  final String? tid;

  final String? title;
  final String? description;

  const Params({
    this.uid,
    this.email,
    this.password,
    this.userName,
    this.tid,
    this.title,
    this.description,
  });

  @override
  List<Object?> get props => [uid, tid];
}
