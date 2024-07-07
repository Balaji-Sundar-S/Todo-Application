import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/features/auth/data/datasources/remote_datasource.dart';
import 'package:todo_application/features/auth/data/repositories/auth.repositoryimpl.dart';
import 'package:todo_application/features/auth/domain/repositories/auth.repository.dart';
// import 'package:todo_application/features/auth/domain/usecases/authstatechanges.dart';
import 'package:todo_application/features/auth/domain/usecases/sign_in.dart';
import 'package:todo_application/features/auth/domain/usecases/sign_out.dart';
import 'package:todo_application/features/auth/domain/usecases/sign_up.dart';
import 'package:todo_application/features/auth/presentation/logic/auth.state_notifier.dart';
import 'package:todo_application/features/auth/presentation/logic/state.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authRemoteDataSourceProvider = Provider<AuthDataSource>((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return AuthDataSourceImpl(firebaseAuth: firebaseAuth);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.read(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(authDataSource: authDataSource);
});

final signInProvider = Provider<SignIn>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignIn(authRepository: repository);
});

final signUpProvider = Provider<SignUp>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignUp(authRepository: repository);
});

final signOutProvider = Provider<SignOut>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return SignOut(authRepository: repository);
});

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) {
    final signInUsecase = ref.read(signInProvider);
    final signUpUsecase = ref.read(signUpProvider);
    final signOutUsecase = ref.read(signOutProvider);

    return AuthStateNotifier(
      signInUsecase,
      signUpUsecase,
      signOutUsecase,
    );
  },
);
