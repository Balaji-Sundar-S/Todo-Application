import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:DoNow/features/auth/domain/entities/auth.entity.dart';
import 'package:DoNow/features/todo/presentation/pages/todo.page.dart';
import 'package:DoNow/features/auth/presentation/pages/welcome.page.dart';
import 'package:DoNow/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<AuthEntity>(
      future: _getCachedUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            home: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            ),
          );
        } else if (snapshot.hasData && snapshot.data?.uid != null) {
          // print(snapshot.data);
          return ProviderScope(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              title: 'Flutter Auth App',
              home: const TodoPage(),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            title: 'Flutter Auth App',
            home: const WelcomePage(),
          );
        }
      },
    );
  }

  Future<AuthEntity> _getCachedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.get('userId');
    final userEmail = prefs.get('userEmail');
    final userName = prefs.get('userName');
    if (userId != null && userEmail != null && userName != null) {
      return AuthEntity(
        uid: userId.toString(),
        email: userEmail.toString(),
        displayName: userName.toString(),
      );
    }
    return const AuthEntity();
  }
}
