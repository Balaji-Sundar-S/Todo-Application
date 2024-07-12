import 'package:DoNow/core/constants/app.constants.dart';
import 'package:DoNow/core/styles/color.style.dart';
import 'package:DoNow/core/utils/texts/page_heading.dart';
import 'package:DoNow/features/auth/presentation/pages/login.page.dart';
import 'package:DoNow/features/auth/presentation/pages/signup.page.dart';
import 'package:DoNow/features/auth/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void login() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }

  void register() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            const SizedBox(height: 90.0),
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
            const SizedBox(height: 60.0),
            const Center(
              child: Text(
                AppConstants.welcome,
                style: TextStyle(
                  color: AppColors.textfieldText,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppConstants.michroma,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280.0),
              child: AppButton(
                formKey: _formKey,
                onpressed: login,
                text: AppConstants.login,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: AppButton(
                onpressed: register,
                text: AppConstants.ca,
                formKey: _formKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
