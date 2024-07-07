import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/core/params/params.dart';
import 'package:todo_application/features/auth/presentation/logic/auth.provider.dart';
import 'package:todo_application/core/utils/utils.dart';
import 'package:todo_application/features/auth/presentation/logic/state.dart';
import 'package:todo_application/features/auth/presentation/pages/login.page.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String displayName = '';
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authStateProvider.notifier);
    ref.listen<AuthState>(
      authStateProvider,
      (previous, next) {
        next.whenOrNull(
          initial: () => Utils.showLoader(context),
          data: (data) {
            Utils.dismissLoader(context);
            if (data != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => LoginPage(),
                ),
              );
            }
          },
          error: (e) {
            Utils.dismissLoader(context);
            return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text('$e'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _username,
              decoration: const InputDecoration(labelText: 'UserName'),
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPassword,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ElevatedButton(
              onPressed: () async {
                if (_password.text == _confirmPassword.text) {
                  setState(() {
                    _errorMessage = '';
                  });
                  var params = Params(
                    email: _email.text,
                    password: _password.text,
                    userName: _username.text,
                  );
                  await authNotifier.signUp(params);
                  _updateDisplayName();
                } else {
                  setState(() {
                    _errorMessage = 'password do not match';
                  });
                }
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateDisplayName() async {
    try {
      User? user = _firebaseAuth.currentUser;
      await user?.updateProfile(displayName: _username.text);
      await user?.reload();
      user = _firebaseAuth.currentUser;
      setState(() {
        displayName = '${user?.displayName}';
      });
      print(displayName);
    } catch (e) {
      setState(() {
        displayName = '';
      });
    }
  }
}
