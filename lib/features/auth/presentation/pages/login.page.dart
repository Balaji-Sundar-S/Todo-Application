import 'package:DoNow/features/auth/presentation/pages/welcome.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:DoNow/core/constants/app.constants.dart';
import 'package:DoNow/core/params/params.dart';
import 'package:DoNow/core/styles/color.style.dart';
import 'package:DoNow/core/utils/texts/page_heading.dart';
import 'package:DoNow/features/auth/presentation/logic/auth.provider.dart';
import 'package:DoNow/core/utils/utils.dart';
import 'package:DoNow/features/auth/presentation/logic/state.dart';
import 'package:DoNow/features/auth/presentation/pages/forgot.password.dart';
import 'package:DoNow/features/auth/presentation/pages/signup.page.dart';
import 'package:DoNow/features/auth/presentation/widgets/button.dart';
import 'package:DoNow/features/auth/presentation/widgets/textfield.dart';
import 'package:DoNow/features/todo/presentation/pages/todo.page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // String displayName = '';
  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authStateProvider.notifier);

    void _login() async {
      var params = Params(
        email: _email.text,
        password: _password.text,
      );
      await authNotifier.signIn(params);
    }

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 10.0),
            child: PageHeading(text: AppConstants.login),
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
                controller: _email,
                obscure: false,
                text: AppConstants.eye,
              ),
              const SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTextfield(
                    controller: _password,
                    obscure: true,
                    text: AppConstants.eyp,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text(AppConstants.fp),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              AppButton(
                onpressed: _login,
                text: AppConstants.login,
                formKey: _formKey,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppConstants.dha,
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
                          builder: (_) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      AppConstants.register,
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
      ),
    );
  }
}
