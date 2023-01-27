import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/main.dart';
import 'package:habit_app/ui/components/big_button.dart';
import 'package:habit_app/ui/components/circle_button.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:habit_app/utils/labels.dart';

class CongratsSheet extends StatelessWidget {
  const CongratsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return SafeArea(
      child: Card(
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    Assets.teepee2,
                  ),
                  Text(
                    Labels.congratulations,
                    style: style.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
                    textAlign: TextAlign.center,
                    style: style.titleMedium2,
                  ),
                  const SizedBox(height: 28),
                  BigButton(
                    elevation: 0,
                    onPressed: () {
                     
                    },
                    text: Labels.createNewHabit,
                  ),
                  const SizedBox(height: 8),
                  MaterialButton(
                    elevation: 0,
                    color: scheme.primaryContainer,
                    textColor: scheme.onPrimary,
                    onPressed: () {},
                    child: Text(Labels.continue_),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: CircleButton(
                child: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
