import 'package:flutter/material.dart';
import 'package:habit_app/core/providers/cache_provider.dart';
import 'package:habit_app/root.dart';
import 'package:habit_app/ui/auth/providers/auth_provider.dart';
import 'package:habit_app/utils/labels.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/bg.dart';




class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});
  static const route = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {

  void initState() {
    init();
    super.initState();
  }

  void init()async{
   await ref.read(cacheProvider.future);
   ref.read(userProvider);
   // ignore: use_build_context_synchronously
   Navigator.pushNamedAndRemoveUntil(context, Root.route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Material(
      child: Bg(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Center(
                child: Text(
                  Labels.welcomeTo,
                  style: style.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }
