import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/colors.dart';
import 'package:habit_app/ui/components/big_button.dart';
import 'package:habit_app/ui/habits/providers/write_habit_view_model_provider.dart';
import 'package:habit_app/ui/habits/widgets/custom_switch.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:habit_app/utils/labels.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddReminderSheet extends ConsumerWidget {
  const AddReminderSheet({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    final media = MediaQuery.of(context);
    final model = ref.watch(writeHabitViewModelProvider);
    return SafeArea(
      child: SizedBox(
        height: media.size.height * 0.6,
        child: Padding(
          padding: const EdgeInsets.all(20.0).copyWith(bottom: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 4 / 3,
                  children: List.generate(
                    36,
                    (index) => TimeOfDay.fromDateTime(
                      DateTime(
                        2022,
                        1,
                        1,
                        6,
                        0,
                      ).add(
                        Duration(minutes: index * 30),
                      ),
                    ),
                  ).map((e) {
                    void toggle(){
                      model.toggleReminder(e);
                    }
                    final value = model.initial.reminders.contains(e);
                    return TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: value
                            ? scheme.primaryContainer
                            : scheme.surfaceVariant,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: toggle,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            e.format(context),
                            style: style.titleMedium!.copyWith(fontSize: 18),
                          ),
                          CustomSwitch(
                            value: value,
                            onSwitch: toggle,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: BigButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
      ),
    );
  }
}
