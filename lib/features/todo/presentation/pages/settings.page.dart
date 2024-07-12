import 'package:DoNow/core/constants/app.constants.dart';
import 'package:DoNow/core/utils/texts/page_heading.dart';
import 'package:DoNow/features/auth/presentation/logic/auth.provider.dart';
import 'package:DoNow/features/auth/presentation/pages/welcome.page.dart';
import 'package:DoNow/features/auth/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _signOut() async {
    final authNotifier = ref.read(authStateProvider.notifier);
    await authNotifier.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const WelcomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const PageHeading(text: AppConstants.settings),
        ),
        body: Column(
          children: [
            const SizedBox(height: 30.0),
            const SizedBox(height: 30.0),
            Form(
              key: _formKey,
              child: Center(
                child: AppButton(
                  onpressed: _signOut,
                  text: AppConstants.logout,
                  formKey: _formKey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
