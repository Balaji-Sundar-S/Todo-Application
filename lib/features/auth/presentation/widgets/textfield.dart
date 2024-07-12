import 'package:flutter/material.dart';
import 'package:DoNow/core/styles/color.style.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool obscure;
  final String? text;
  AppTextfield({
    super.key,
    required this.controller,
    required this.obscure,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: obscure
          ? TextFormField(
              maxLines: 1,
              obscureText: obscure,
              controller: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid credential';
                }
                return null;
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    style: BorderStyle.solid,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                hintText: text,
                hintStyle: const TextStyle(
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  // height: 30.1,
                  color: AppColors.textfieldText,
                ),
              ),
            )
          : SingleChildScrollView(
              child: TextFormField(
                maxLines: null,
                obscureText: obscure,
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid credential';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  hintText: text,
                  hintStyle: const TextStyle(
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    // height: 30.1,
                    color: AppColors.textfieldText,
                  ),
                ),
              ),
            ),
    );
  }
}
