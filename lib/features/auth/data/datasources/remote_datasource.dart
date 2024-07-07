import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_application/features/auth/data/models/auth.model.dart';
import 'package:todo_application/features/auth/domain/entities/auth.entity.dart';
import 'package:todo_application/core/params/params.dart';

abstract class AuthDataSource {
  Future<AuthEntity> signIn(Params params);
  Future<AuthEntity> signUp(Params params);
  Future<void> signOut();
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<AuthEntity> signIn(Params params) async {
    try {
      var userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email ?? '',
        password: params.password ?? '',
      );

      final json = {
        'uid': userCredentials.user?.uid,
        'email': userCredentials.user?.email,
      };
      final model = AuthModel.fromJson(json);
      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthEntity> signUp(Params params) async {
    try {
      var userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email ?? '',
        password: params.password ?? '',
      );

      final json = {
        'uid': userCredentials.user?.uid,
        'email': userCredentials.user?.email,
        'userName': userCredentials.user?.displayName,
      };
      final model = AuthModel.fromJson(json);
      return model;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
