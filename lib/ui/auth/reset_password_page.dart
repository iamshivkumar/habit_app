// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/auth/providers/auth_provider.dart';
import 'package:habit_app/ui/auth/widgets/email_field.dart';
import 'package:habit_app/ui/components/app_back_button.dart';
import 'package:habit_app/ui/components/app_snackbar.dart';
import 'package:habit_app/ui/components/big_button.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/labels.dart';
import '../components/circle_button.dart';

class ResetPasswordPage extends HookConsumerWidget {
  const ResetPasswordPage({super.key});

  static const route = "/reset-password";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    final model = ref.read(authProvider);
    final formKey = useRef(GlobalKey<FormState>());

    return Scaffold(
      backgroundColor: scheme.primaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: AppBackButton()),
              const Spacer(),
              Text(
                Labels.forgotYourPassword,
                style: style.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: SvgPicture.asset(
                  Assets.forgot,
                ),
              ),
              const Spacer(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        Labels.enterYourRegisteredEmail,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: formKey.value,
                        child: EmailField(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          ref.watch(authProvider.select(
                            (value) => value.email.isNotEmpty,
                          ));
                          return BigButton(
                            stretch: true,
                            onPressed: model.email.isNotEmpty
                                ? () async {
                                    if (formKey.value.currentState!
                                        .validate()) {
                                      try {
                                        await model.resetPassword();
                                        AppSnackBar.message(
                                            context, 'Reset link sent!');
                                        Navigator.pop(context);
                                      } catch (e) {
                                        AppSnackBar.error(context, e);
                                      }
                                    }
                                  }
                                : null,
                            text: Labels.sendResetLink,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "${Labels.rememberPassword} ",
                  style: style.bodyMedium,
                  children: [
                    TextSpan(
                      text: Labels.login,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
