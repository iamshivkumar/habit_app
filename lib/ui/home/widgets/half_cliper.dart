import 'package:flutter/material.dart';

class HalfCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 12;
    const h1 = 9;
    const w2 = 6.5;
    const h2 = 6;
    const r = 4;

    var path = Path();
    path.moveTo(0, 9);
    path.arcToPoint(
      Offset(6.5, 6),
      radius: Radius.circular(4),
    );
    path.lineTo(size.width - 6, size.height - 6.5);
    path.arcToPoint(
      Offset(size.width - 9, size.height),
      radius: Radius.circular(4),
    );
        path.lineTo(12, size.height);
    path.arcToPoint(
      Offset(0, size.height - 12),
      radius: Radius.circular(12),
    );
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
