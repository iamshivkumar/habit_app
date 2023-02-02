// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/root.dart';
import 'package:habit_app/ui/auth/widgets/password_field.dart';
import 'package:habit_app/ui/components/app_snackbar.dart';
import 'package:habit_app/ui/components/big_button.dart';
import 'package:habit_app/ui/components/loading_layer.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:habit_app/utils/labels.dart';
import 'package:habit_app/utils/validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/auth_provider.dart';
import 'widgets/facebook_button.dart';
import 'widgets/google_button.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  static const route = "/sign-up";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    final model = ref.read(authProvider);
    final formKey = useRef(GlobalKey<FormState>());
    return Theme(
      data: theme.copyWith(
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          fillColor: scheme.surface,
        ),
      ),
      child: LoadingLayer(
        child: Scaffold(
          backgroundColor: scheme.primaryContainer,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
              bottom: 8,
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: scheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        value: true,
                        onChanged: (value) {},
                      ),
                      Text(
                        Labels.keepMeSignedIn,
                        style: style.bodyLarge,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: scheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        value: true,
                        onChanged: (value) {},
                      ),
                      Flexible(
                        child: Text(
                          Labels.emailMeAbout,
                          style: style.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Consumer(
                    builder: (context, ref, child) {
                      ref.watch(authProvider.select((value) => value.enabled));
                      return BigButton(
                        stretch: true,
                        onPressed: model.enabled
                            ? () async {
                                if (formKey.value.currentState!.validate()) {
                                  try {
                                    await model.register();
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, Root.route, (route) => false);
                                  } catch (e) {
                                    AppSnackBar.error(context, e);
                                  }
                                }
                              }
                            : null,
                        text: Labels.createAccount,
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: scheme.outline,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        Labels.orSignInWith,
                        style: TextStyle(color: scheme.outline),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          color: scheme.outline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Expanded(
                        child: GoogleButton(),
                      ),
                      const SizedBox(width: 12),
                      FacebookButton(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "${Labels.alreadyHaveAnAccount} ",
                      style: style.bodyMedium,
                      children: [
                        TextSpan(
                            text: Labels.signIn,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Root.route, (route) => false);
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey.value,
                child: Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(Assets.createYourAccount),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Labels.createYourAccount,
                      style: style.headlineSmall,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      style: TextStyle(
                        color: scheme.primary,
                      ),
                      textCapitalization: TextCapitalization.words,
                      initialValue: model.name,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        hintText: Labels.name,
                      ),
                      onChanged: (value) => model.name = value,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      initialValue: model.email,
                      style: TextStyle(
                        color: scheme.primary,
                      ),
                      decoration: const InputDecoration(
                        hintText: Labels.email,
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      onChanged: (value) => model.email = value,
                      validator: Validators.validateEmail,
                    ),
                    const SizedBox(height: 8),
                    const PasswordField()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
