import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/auth/reset_password_page.dart';
import 'package:habit_app/ui/components/custom_scaffold.dart';
import 'package:habit_app/ui/components/status_button.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:habit_app/utils/formats.dart';
import 'package:habit_app/utils/labels.dart';

class WriteHabitPage extends StatelessWidget {
  const WriteHabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return CustomScaffold(
      title: Labels.newHabit,
      leading: CircleButton(
        child: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: scheme.surface,
                      hintText: Labels.enterHabitName,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
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
                          )),
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
                        children: List.generate(
                      7,
                      (index) {
                        return DateTime.now().add(
                            Duration(days: index - DateTime.now().weekday));
                      },
                    )
                            .map(
                              (e) => Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      e.labelDay,
                                      style: style.bodySmall!.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const StatusButton(
                                      size: 38,
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList()),
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
                        const Text(Labels.custom),
                        Icon(Icons.keyboard_arrow_right_rounded)
                      ],
                    ),
                    onPressed: () {},
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
                    Material(
                      shape: const StadiumBorder(),
                      color: theme.indicatorColor.withOpacity(0.25),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text('Off',style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          CupertinoSwitch(
                            value: false,
                            trackColor: Colors.transparent,
                            onChanged: (v) {},
                            thumbColor: scheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
