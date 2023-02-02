// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:habit_app/ui/components/app_snackbar.dart';
import 'package:habit_app/ui/components/custom_scaffold.dart';
import 'package:habit_app/utils/labels.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../root.dart';
import 'providers/auth_provider.dart';

class VerificationPage extends ConsumerStatefulWidget {
  const VerificationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationPageState();
}

class _VerificationPageState extends ConsumerState<VerificationPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
        WidgetsBinding.instance.addObserver(this);
  }

  void reload() async {
    await ref.read(authProvider).reload();

    ref.refresh(userProvider.stream).listen((event) {
      if (event?.emailVerified == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, Root.route, (route) => false);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
        // WidgetsBinding.instance.addObserver(this);

    if (state == AppLifecycleState.resumed) {
      reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final userRef = ref.read(userProvider);
    final user = userRef.value!;
        final model = ref.read(authProvider);

    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              Labels.verificationEmail(user.email!),
              textAlign: TextAlign.center,
              style: style.titleLarge,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  reload();
                },
                child: Text('DONE'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  try {
                    await model.sendVerificationEmail();
                    AppSnackBar.message(context, 'Verification email sent');
                  } catch (e) {
                    AppSnackBar.error(context, e);
                  }
                },
                child: Text('RESEND'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
