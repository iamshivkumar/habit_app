import 'package:flutter/material.dart';

class Bg extends StatelessWidget {
  const Bg({super.key ,required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/bg.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
