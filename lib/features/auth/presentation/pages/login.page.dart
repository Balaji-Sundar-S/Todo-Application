import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_application/core/params/params.dart';
import 'package:todo_application/features/auth/presentation/logic/auth.provider.dart';
import 'package:todo_application/core/utils/utils.dart';
import 'package:todo_application/features/auth/presentation/logic/state.dart';
import 'package:todo_application/features/auth/presentation/pages/forgot.password.dart';
import 'package:todo_application/features/auth/presentation/pages/signup.page.dart';
import 'package:todo_application/features/todo/presentation/pages/todo.page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // String displayName = '';
  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authStateProvider.notifier);

    ref.listen<AuthState>(
      authStateProvider,
      (previous, next) {
        next.when(
          initial: () => Utils.showLoader(context),
          loading: () => Utils.showLoader(context),
          data: (data) {
            Utils.dismissLoader(context);
            if (data != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const TodoPage(),
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
        title: const Text('Login'),
        // backgroundColor: Colors.amber[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField(
            //   controller: _username,
            //   decoration: const InputDecoration(labelText: 'UserName'),
            // ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                // _updateDisplayName();
                var params = Params(
                  email: _email.text,
                  password: _password.text,
                  // userName: _username.text,
                );
                await authNotifier.signIn(params);
                // _updateDisplayName();
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                );
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage(),
                  ),
                );
              },
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _updateDisplayName() async {
  //   try {
  //     User? user = _firebaseAuth.currentUser;
  //     await user?.updateProfile(displayName: _username.text);
  //     await user?.reload();
  //     user = _firebaseAuth.currentUser;
  //     setState(() {
  //       displayName = '${user?.displayName}';
  //     });
  //     print(displayName);
  //   } catch (e) {
  //     setState(() {
  //       displayName = '';
  //     });
  //   }
  // }
}
