import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/onboarding/onboarding_data.dart';
import 'package:habit_app/utils/labels.dart';

import '../auth/login_page.dart';

const List<OnboardingData> data = [
  OnboardingData(
      title: Labels.welcomeTo2,
      description: Labels.weCanHelpYou,
      image: "assets/welcome.png",
      isSvg: false),
  OnboardingData(
    title: Labels.createNewHabitEasily,
    description: Labels.weCanHelpYou,
    image: "assets/habit.svg",
  ),
  OnboardingData(
    title: Labels.keepTrackOf,
    description: Labels.weCanHelpYou,
    image: "assets/progress.svg",
  ),
  OnboardingData(
    title: Labels.joinASupportive,
    description: Labels.weCanHelpYou,
    image: "assets/community_support.svg",
  )
];

class OnboardingPage extends HookWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    final controller = useTabController(initialLength: data.length);
    final index = useState<int>(0);
    controller.addListener(() {
      index.value = controller.index;
    });
    
    void done()async{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: index.value == data.length - 1
              ? MaterialButton(
                   color: scheme.primary,
                   textColor: scheme.onPrimary,
                  onPressed:done,
                  child: const Text(Labels.getStarted),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: done,
                      child: const Text(Labels.skip),
                    ),
                    Row(
                      children: List.generate(
                        data.length,
                        (index) {
                          final isSelected = controller.index == index;
                          return Container(
                            width: isSelected ? 17 : 12,
                            height: isSelected ? 17 : 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected ? theme.dividerColor : null,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: Center(
                              child: Container(
                                width: isSelected ? 13 : 12,
                                height: isSelected ? 13 : 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? scheme.secondary
                                      : scheme.primary,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.animateTo(
                          controller.index + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text(Labels.next),
                    ),
                  ],
                ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: controller,
          children: data
              .map(
                (e) => OnboardingItem(data: e),
              )
              .toList(),
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.data});

  final OnboardingData data;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          data.title,
          style: style.headlineMedium,
          textAlign: TextAlign.center,
        ),
        AspectRatio(
          aspectRatio: 1,
          child: data.isSvg
              ? SvgPicture.asset(
                  data.image,
                )
              : Image.asset(
                  data.image,
                ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: data.description.map(
            (e) {
              final index = data.description.indexOf(e);
              return TextSpan(
                text: e.toUpperCase(),
                style: style.titleMedium!.copyWith(
                    fontSize: 17, color: index.isOdd ? scheme.primary : null),
              );
            },
          ).toList()),
        ),
      ],
    );
  }
}
