import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({super.key, required this.onPressed, required this.text, this.stretch = false});
  
  final VoidCallback onPressed;
  final String text;
  final bool stretch;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return MaterialButton(
      minWidth: stretch? double.infinity:null,
      color: scheme.primary,
      textColor: scheme.onPrimary,
      onPressed: onPressed,
      child:  Text(text),
    );
  }
}
