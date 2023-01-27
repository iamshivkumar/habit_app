import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/components/custom_scaffold.dart';
import 'package:habit_app/ui/components/status_button.dart';
import 'package:habit_app/ui/habits/habit_page.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:habit_app/utils/formats.dart';
import 'package:habit_app/utils/utils.dart';

import '../../utils/labels.dart';
import '../components/circle_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return CustomScaffold(
      title: Labels.homepage,
      leading: CircleButton(
        child: Center(
          child: SvgPicture.asset(
            Assets.menuIcon,
            height: 24,
            width: 24,
          ),
        ),
      ),
      traling: CircleAvatar(
        radius: 22,
        backgroundImage: AssetImage(Assets.profile),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AspectRatio(
              aspectRatio: 5 / 2,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(Assets.mask),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Labels.weFirstMake,
                        style: style.titleMedium!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        Labels.anonymous,
                        style: style.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            Labels.habits.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HabbitPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 74,
                          decoration: BoxDecoration(
                            color: scheme.surface,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Read A Book",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Row(
                            children: Utils.weekDays
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: Card(
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              e.labelDay,
                                              style: style.bodySmall!.copyWith(
                                                fontSize: 10,
                                              ),
                                            ),
                                            Text(
                                              "${e.day}",
                                              style: style.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: scheme.surface,
                          ),
                          height: 74,
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: List.generate(
                              7,
                              (index) => const StatusButton(
                                size: 54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
