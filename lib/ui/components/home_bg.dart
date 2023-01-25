import 'package:flutter/material.dart';

import '../../utils/assets.dart';

class HomeBg extends StatelessWidget {
  const HomeBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 56),
      child: Image.asset(
        Assets.homeBg,
        height: 543,
        width: 555,
      ),
    );
  }
}