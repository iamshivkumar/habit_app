import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_app/ui/auth/login_page.dart';
import 'package:habit_app/ui/auth/providers/auth_provider.dart';
import 'package:habit_app/ui/dashboard/dashboard.dart';
import 'package:habit_app/ui/home/home_page.dart';
import 'package:habit_app/ui/onboarding/onboarding_page.dart';
import 'package:habit_app/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/providers/cache_provider.dart';


class Root extends ConsumerWidget {
  const Root({super.key});
  static const route = '/root';
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cache = ref.watch(cacheProvider).value!;
    final seen = cache.getBool(Constants.seen) ?? false;
    final User? user = ref.read(userProvider).asData?.value;
    return !seen? const OnboardingPage(): user == null? LoginPage(): Dashboard();
  }
}