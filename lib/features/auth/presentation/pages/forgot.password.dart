// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:DoNow/core/constants/app.constants.dart';
import 'package:DoNow/core/styles/color.style.dart';
import 'package:DoNow/core/utils/texts/page_heading.dart';
import 'package:DoNow/features/auth/presentation/logic/auth.provider.dart';
import 'package:DoNow/features/auth/presentation/pages/login.page.dart';
import 'package:DoNow/features/auth/presentation/widgets/button.dart';
import 'package:DoNow/features/auth/presentation/widgets/textfield.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      authStateProvider,
      (previous, next) {
        next.whenOrNull(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (data) {
            return showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text(AppConstants.prl),
                );
              },
            );
          },
          error: (error) => Center(
            child: Text('Error: $error'),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 4, top: 18),
          color: AppColors.textfieldText,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginPage()));
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: PageHeading(text: AppConstants.fpt)),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            const SizedBox(height: 190.0),
            AppTextfield(
              controller: emailController,
              obscure: false,
              text: AppConstants.eye,
            ),
            const SizedBox(height: 30),
            AppButton(
              onpressed: passwordReset,
              text: AppConstants.sprl,
              formKey: _formKey,
            )
          ],
        ),
      ),
    );
  }

  Future passwordReset() async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      if (!context.mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(AppConstants.success),
          content: const Text(AppConstants.prl),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text(AppConstants.ok),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(AppConstants.error),
            content: Text('$e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('${e.message}'),
              ),
            ],
          ),
        );
      }
    }
  }
}
