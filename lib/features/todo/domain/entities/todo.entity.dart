import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String? tid;
  final String? title;
  final String? description;

  const TodoEntity({
    this.tid,
    this.title,
    this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [tid];
}
