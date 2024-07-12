import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/features/todo/data/models/todo.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TodoRemoteDatasource {
  Future<void> addTodo(Params params);
  Future<void> updateTodo(Params params);
  Future<void> deleteTodo(Params params);
  Future<List<TodoModel>> getTodo(Params params);
}

class TodoRemoteDatasourceImpl implements TodoRemoteDatasource {
  final FirebaseFirestore _firebaseFirestore;

  TodoRemoteDatasourceImpl({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  @override
  Future<void> addTodo(Params params) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc('${params.uid}')
          .collection('todos')
          .doc('${params.tid}')
          .set(
            TodoModel(
              tid: params.tid,
              title: params.title,
              description: params.description,
            ).toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(Params params) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc('${params.uid}')
          .collection('todos')
          .doc('${params.tid}')
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> getTodo(Params params) async {
    try {
      final querySnapshot = await _firebaseFirestore
          .collection('users')
          .doc('${params.uid}')
          .collection('todos')
          // .orderBy("asc")
          .get();

      var model = querySnapshot.docs
          .map((doc) => TodoModel.fromJson(doc.data()))
          .toList();

      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(Params params) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc('${params.uid}')
          .collection('todos')
          .doc('${params.tid}')
          .update(
            TodoModel(
              tid: params.tid,
              title: params.title,
              description: params.description,
            ).toJson(),
          );
    } catch (e) {
      rethrow;
    }
  }
}
