import 'package:flutter/material.dart';

class AppSnackBar {


  static void error(BuildContext context, dynamic e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          e.toString(),
        ),
      ),
    );
  }
}
