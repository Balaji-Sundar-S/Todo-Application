import 'package:DoNow/features/todo/domain/entities/todo.entity.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    super.tid,
    super.title,
    super.description,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      tid: json['tid'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tid': tid,
      'title': title,
      'description': description,
    };
  }
}
