import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, this.value = false});

  final bool value;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Material(
      shape: const StadiumBorder(),
      color: value
          ? scheme.primary.withOpacity(0.2)
          : scheme.onPrimary.withOpacity(0.1),
      child: Stack(
        alignment: value ? Alignment.centerLeft : Alignment.centerRight,
        children: [
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              value ? 'On' : 'Off',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: value ? scheme.primary : scheme.onPrimary,
              ),
            ),
          ),
          CupertinoSwitch(
            activeColor: Colors.transparent,
            value: value,
            trackColor: Colors.transparent,
            onChanged: (v) {},
            thumbColor: value ? scheme.primary : scheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
