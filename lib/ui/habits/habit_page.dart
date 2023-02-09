import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/core/models/habit.dart';
import 'package:habit_app/ui/auth/reset_password_page.dart';
import 'package:habit_app/ui/components/app_back_button.dart';
import 'package:habit_app/ui/components/big_button.dart';
import 'package:habit_app/ui/components/custom_scaffold.dart';
import 'package:habit_app/ui/components/status_button.dart';
import 'package:habit_app/ui/habits/widgets/congrats_sheet.dart';
import 'package:habit_app/ui/home/home_root.dart';
import 'package:habit_app/utils/formats.dart';
import 'package:habit_app/utils/labels.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/assets.dart';
import '../../utils/utils.dart';
import '../components/circle_button.dart';

class HabbitPage extends ConsumerWidget {
  const HabbitPage({super.key,required this.habit});
  static const route = '/habbit';

  final Habit habit;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return CustomScaffold(
      title: habit.name,
      leading: const AppBackButton(),
      traling:  CircleButton(
        onPressed: () {
          ref.read(writerProvider.notifier).state = true;
        },
        child: Icon(
          Icons.edit_outlined,
        ),
      ),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: scheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                scheme.primaryContainer, BlendMode.darken),
                            image: const AssetImage(
                              Assets.teepee,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(flex: 2),
                          Text(
                            habit.name,
                            style: style.titleMedium,
                          ),
                          const Spacer(flex: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                size: 16,
                                color: scheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                Labels.repeatEveryday,
                                style: style.bodySmall,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.repeat_rounded,
                                size: 16,
                                color: scheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                Labels.reminders,
                                style: style.bodySmall,
                              ),
                            ],
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_left_rounded),
                    ),
                    Text(
                      'January',
                      style: style.titleMedium,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: Utils.weekDays
                      .map(
                        (e) => Expanded(
                          child: Text(
                            e.labelDay,
                            style: style.bodySmall!.copyWith(
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 2),
                GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 47 / 72,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  padding: const EdgeInsets.all(6),
                  children: Utils.allDaysOfMonth(DateTime.now())
                      .map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: scheme.primaryContainer),
                          child: Column(
                            children: [
                              const Spacer(flex: 2),
                              Text(
                                '${e.day}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: e.month != DateTime.now().month
                                      ? scheme.onPrimary.withOpacity(0.3)
                                      : null,
                                ),
                              ),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: StatusButton(
                                    value: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Container(
            decoration:
                BoxDecoration(color: scheme.primaryContainer, boxShadow: [
              BoxShadow(
                color: scheme.primary.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 10,
              ),
            ]),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  Labels.analytics,
                  style: style.bodySmall!.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 22),
                Card(
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              OverviewWidget(
                                title: Labels.days(20),
                                subtitle: Labels.longestStreak,
                                asset: Assets.fire,
                              ),
                              Container(
                                width: 1,
                                color: theme.dividerColor,
                              ),
                              OverviewWidget(
                                title: Labels.days(0),
                                subtitle: Labels.currentStreak,
                                asset: Assets.flash,
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: Row(
                            children: [
                              OverviewWidget(
                                title: Labels.percentage(98),
                                subtitle: Labels.completionRate,
                                asset: Assets.rate,
                              ),
                              Container(
                                width: 1,
                                color: theme.dividerColor,
                              ),
                              OverviewWidget(
                                title: '7',
                                subtitle: Labels.averageEasinessScore,
                                asset: Assets.leaf,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                BigButton(
                  
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) => CongratsSheet(),
                    );
                  },
                  text: Labels.markHabitAsComplete,
                ),
                const SizedBox(height: 8),
                MaterialButton(
                  color: scheme.surface,
                  textColor: scheme.onPrimary,
                  onPressed: () {},
                  child: Text(Labels.markHabitAsMissed),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.asset,
  });

  final String title;
  final String subtitle;
  final String asset;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: style.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: style.bodySmall,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 19,
              backgroundColor: scheme.primary.withOpacity(0.2),
              child: SvgPicture.asset(asset),
            ),
          ],
        ),
      ),
    );
  }
}
