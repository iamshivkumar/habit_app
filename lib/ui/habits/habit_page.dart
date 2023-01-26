import 'package:flutter/material.dart';
import 'package:habit_app/ui/auth/reset_password_page.dart';
import 'package:habit_app/ui/components/app_back_button.dart';
import 'package:habit_app/ui/components/custom_scaffold.dart';
import 'package:habit_app/utils/labels.dart';

import '../../utils/assets.dart';

class HabbitPage extends StatelessWidget {
  const HabbitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return CustomScaffold(
      title: Labels.readABook,
      leading: AppBackButton(),
      traling: CircleButton(
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
                            Labels.readABook,
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
          const SizedBox(height: 20),
          Container(
            height: 30,
            decoration: BoxDecoration(
              
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFBEADB).withOpacity(0),
                  Color(0xFFFFF3E9),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
