import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/colors.dart';
import 'package:habit_app/ui/components/big_button.dart';
import 'package:habit_app/ui/habits/widgets/custom_switch.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:habit_app/utils/labels.dart';

class AddReminderSheet extends StatelessWidget {
  const AddReminderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 4 / 3,
              children: List.generate(
                12,
                (index) => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: index.isEven
                        ? scheme.primaryContainer
                        : scheme.surfaceVariant,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '06:00 AM',
                        style: style.titleMedium!.copyWith(fontSize: 18),
                      ),
                      CustomSwitch(
                        value: index.isEven,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: BigButton(
                    onPressed: () {},
                    text: Labels.addReminder,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      // padding: const EdgeInsets.all(16),
                      side: BorderSide(
                        color: scheme.onPrimary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    onPressed: () {},
                    child: SvgPicture.asset(
                      Assets.bell,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
