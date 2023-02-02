import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/components/app_back_button.dart';
import 'package:habit_app/ui/components/custom_scaffold.dart';
import 'package:habit_app/ui/components/status_button.dart';
import 'package:habit_app/ui/habits/providers/write_habit_view_model_provider.dart';
import 'package:habit_app/ui/habits/widgets/add_time_sheet.dart';
import 'package:habit_app/ui/habits/widgets/custom_switch.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:habit_app/utils/formats.dart';
import 'package:habit_app/utils/labels.dart';
import 'package:habit_app/utils/validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/add_reminder_sheet.dart';

class WriteHabitPage extends HookConsumerWidget {
  const WriteHabitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    final model = ref.watch(writeHabitViewModelProvider);
    final formKey = useRef(GlobalKey<FormState>());
    return CustomScaffold(
      title: Labels.newHabit,
      leading: const AppBackButton(),
      body: SafeArea(
        child: Form(
          key: formKey.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              initialValue: model.name,
                              decoration: InputDecoration(
                                fillColor: scheme.surface,
                                hintText: Labels.enterHabitName,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                              validator: Validators.required,
                              onSaved: (v) => model.name = v!,
                            ),
                          ),
                          SizedBox(width: 12),
                          Stack(
                            children: [
                              SizedBox(
                                height: 52,
                                width: 52,
                                child: Card(
                                  child: Center(
                                    child: SvgPicture.asset(
                                      Assets.reader,
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Transform.translate(
                                  offset: const Offset(4, -4),
                                  child: CircleAvatar(
                                    radius: 9,
                                    backgroundColor: scheme.primary,
                                    foregroundColor: scheme.surface,
                                    child: Icon(Icons.add_rounded, size: 16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Card(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    Labels.habitFrequency,
                                    style: style.titleMedium,
                                  ),
                                ),
                                CupertinoButton(
                                  child: Row(
                                    children: [
                                      const Text(Labels.custom),
                                      Icon(Icons.keyboard_arrow_right_rounded)
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            Divider(height: 1),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 10, 8, 16),
                              child: Row(
                                  children: model.days.map((e) {
                                final count = model.frequency[e.labelDay] ?? 0;
                                return Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        e.labelDay,
                                        style: style.bodySmall!.copyWith(
                                          fontSize: 10,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      GestureDetector(
                                        onTap: () {
                                          int value = count + 1;
                                          if (value == 3) {
                                            value = 0;
                                          }
                                          model.updateFrequency(
                                              e.labelDay, value);
                                        },
                                        child: StatusButton(
                                          size: 38,
                                          value: count,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList()),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                Labels.reminder,
                                style: style.titleMedium,
                              ),
                            ),
                            CupertinoButton(
                              child: Row(
                                children: [
                                  Text(model.reminders.length.toString()),
                                  Icon(Icons.keyboard_arrow_right_rounded)
                                ],
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  builder: (context) =>
                                      const AddReminderSheet(),
                                );
                                // showModalBottomSheet(
                                //   context: context,
                                //   isScrollControlled: true,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.only(
                                //           topLeft: Radius.circular(12),
                                //           topRight: Radius.circular(12))),
                                //   builder: (context) => const AddTimeSheet(),
                                // );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  Labels.notification,
                                  style: style.titleMedium,
                                ),
                              ),
                              CustomSwitch()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      child: Transform.translate(
                        offset: const Offset(0, -35),
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            Assets.image,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 16 + 35),
                          Text(
                            Labels.startThisHabit,
                            style: style.headlineSmall,
                          ),
                          Text(
                            Labels.ullamco,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: style.bodySmall!.color,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SvgPicture.asset(
                            Assets.arrow,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
