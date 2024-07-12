import 'package:flutter/material.dart';
import 'package:DoNow/core/styles/color.style.dart';

class PageHeading extends StatelessWidget {
  final String text;
  const PageHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textfieldText,
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w600,
        fontSize: 26,
      ),
    );
  }
}
