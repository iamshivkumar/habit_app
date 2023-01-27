import 'package:flutter/material.dart';



class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.child,
    this.onPressed
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
        final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Container(
      height: 44,
      width: 44,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: scheme.onPrimary.withOpacity(0.1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: onPressed,
        child: child
      ),
    );
  }
}
