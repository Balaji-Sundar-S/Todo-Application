import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/core/usecases/usecase.dart';
import 'package:DoNow/features/auth/domain/entities/auth.entity.dart';
import 'package:DoNow/features/auth/domain/usecases/sign_in.dart';
import 'package:DoNow/features/auth/domain/usecases/sign_out.dart';
import 'package:DoNow/features/auth/domain/usecases/sign_up.dart';
import 'package:DoNow/features/auth/presentation/logic/state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final SignIn _signIn;
  final SignUp _signUp;
  final SignOut _signOut;

  AuthStateNotifier(
    this._signIn,
    this._signUp,
    this._signOut,
  ) : super(const AuthState.initial());

  Future<void> signIn(Params params) async {
    state = const AuthState.loading();
    final data = await _signIn.call(params);
    data.fold(
      (l) => state = AuthState.error(error: l.msg ?? ''),
      (r) async {
        state = AuthState.data(r);
        await _saveUserToCache(r);
      },
    );
  }

  Future<void> signUp(Params params) async {
    state = const AuthState.loading();
    final data = await _signUp.call(params);

    data.fold(
      (l) => state = AuthState.error(error: l.msg ?? ''),
      (r) async {
        state = AuthState.data(r);
        await _saveUserToCache(r);
      },
    );
  }

  Future<void> signOut() async {
    await _signOut.call(NoParams());
    await _clearUserFromCache();
  }

  Future<void> _saveUserToCache(AuthEntity user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', user.uid ?? '');
    await prefs.setString('userEmail', user.email ?? '');
    await prefs.setString('userName', user.displayName ?? '');
  }

  Future<void> _clearUserFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    await prefs.remove('userEmail');
    await prefs.remove('userName');
  }
}
