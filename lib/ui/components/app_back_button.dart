import 'package:flutter/material.dart';

import '../auth/reset_password_page.dart';
import 'circle_button.dart';


class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleButton(
        child: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      );
  }
}