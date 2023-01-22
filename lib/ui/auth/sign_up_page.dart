import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/components/big_button.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:habit_app/utils/labels.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Theme(
      data: theme.copyWith(
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          fillColor: scheme.surface,
        ),
      ),
      child: Scaffold(
        backgroundColor: scheme.primaryContainer,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SvgPicture.asset(Assets.createYourAccount),
                  SizedBox(height: 20),
                  Text(
                    Labels.createYourAccount,
                    style: style.headlineSmall,
                  ),
                  SizedBox(height: 32),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      hintText: Labels.name,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    style: TextStyle(
                      color: scheme.primary,
                    ),
                    decoration: InputDecoration(
                      hintText: Labels.email,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    style: TextStyle(
                      color: scheme.primary,
                    ),
                    decoration: InputDecoration(
                      hintText: Labels.password,
                      prefixIcon: Icon(Icons.lock_outline),
                      suffix: Text(
                        Labels.show,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
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
                  BigButton(
                    stretch: true,
                    onPressed: () {},
                    text: Labels.createAccount,
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.google,
                            height: 24,
                            width: 24,
                          ),
                          label: Text(
                            Labels.google,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.facebook,
                            height: 24,
                            width: 24,
                          ),
                          label: Text(
                            Labels.facebook,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "${Labels.alreadyHaveAnAccount} ",
                      style: style.bodyMedium,
                      children: [
                        TextSpan(
                          text: Labels.signUp,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
