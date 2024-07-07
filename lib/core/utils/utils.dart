import 'package:flutter/material.dart';
import 'package:todo_application/core/alerts/loader.dart';

class Utils {
  static Future showLoader(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Loader(),
    );
  }

  static dismissLoader(BuildContext context) {
    Navigator.of(context).pop(context);
  }
}
