import 'package:flutter/material.dart';

import '../home/widgets/half_cliper.dart';




class StatusButton extends StatelessWidget {
  const StatusButton({super.key, this.size,required this.value});
  
  final double? size;
  final int value;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      height: size,
      width: size,
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        color: scheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: value==0?null: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipPath(
          clipper: value==1? HalfCliper():null,
          child: Container(
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}