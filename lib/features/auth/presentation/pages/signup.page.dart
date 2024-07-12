import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:DoNow/core/constants/app.constants.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/core/styles/color.style.dart';
import 'package:DoNow/core/utils/texts/page_heading.dart';
import 'package:DoNow/features/auth/presentation/logic/auth.provider.dart';
import 'package:DoNow/core/utils/utils.dart';
import 'package:DoNow/features/auth/presentation/logic/state.dart';
import 'package:DoNow/features/auth/presentation/pages/login.page.dart';
import 'package:DoNow/features/auth/presentation/widgets/button.dart';
import 'package:DoNow/features/auth/presentation/widgets/textfield.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

    Future<void> updateDisplayName() async {
      try {
        User? user = _firebaseAuth.currentUser;
        await user?.updateProfile(displayName: _username.text);
        await user?.reload();
        user = _firebaseAuth.currentUser;
        setState(() {
          displayName = '${user?.displayName}';
        });
        // print(displayName);
      } catch (e) {
        setState(() {
          displayName = '';
        });
      }
    }

    void register() async {
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
        updateDisplayName();
      } else {
        setState(() {
          _errorMessage = AppConstants.pdnm;
        });
      }
    }

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
                  builder: (_) => const LoginPage(),
                ),
              );
            }
          },
          error: (e) {
            Utils.dismissLoader(context);
            return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(AppConstants.error),
                content: Text('$e'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(AppConstants.ok),
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
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 18.0),
          child: PageHeading(text: AppConstants.register),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            const SizedBox(height: 10.0),
            SizedBox(
              width: 168.0,
              height: 168.0,
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/app_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            AppTextfield(
              controller: _username,
              obscure: false,
              text: AppConstants.eyu,
            ),
            const SizedBox(height: 30.0),
            AppTextfield(
              controller: _email,
              obscure: false,
              text: AppConstants.eye,
            ),
            const SizedBox(height: 30.0),
            AppTextfield(
              controller: _password,
              obscure: true,
              text: AppConstants.eyp,
            ),
            const SizedBox(height: 30.0),
            AppTextfield(
              controller: _confirmPassword,
              obscure: true,
              text: AppConstants.cp,
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 30.0),
            AppButton(
              onpressed: register,
              text: AppConstants.register,
              formKey: _formKey,
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppConstants.aha,
                  style: TextStyle(
                    color: AppColors.textfieldText,
                    fontFamily: AppConstants.lexend,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    AppConstants.login,
                    style: TextStyle(
                      fontFamily: AppConstants.lexend,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
