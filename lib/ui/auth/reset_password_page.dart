import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/components/big_button.dart';
import 'package:habit_app/utils/assets.dart';

import '../../utils/labels.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: scheme.primaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 44,
                  width: 44,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: scheme.onPrimary.withOpacity(0.1),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: const Center(
                      child: Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Text(
                Labels.forgotYourPassword,
                style: style.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SvgPicture.asset(
                Assets.forgot,
              ),
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
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: Labels.email,
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BigButton(
                        stretch: true,
                        onPressed: () {},
                        text: Labels.sendResetLink,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
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
