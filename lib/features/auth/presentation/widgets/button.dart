import 'package:flutter/material.dart';
import 'package:DoNow/core/styles/color.style.dart';

class AppButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function onpressed;
  final String text;
  const AppButton(
      {super.key,
      required this.onpressed,
      required this.text,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Colors.black),
      ),
      minWidth: 327,
      height: 54,
      textColor: Colors.white,
      color: AppColors.button,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          onpressed();
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textfieldText,
          fontFamily: 'Lexend',
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
