import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/utils/labels.dart';

import '../components/bg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -250,
            child: Image.asset("assets/bg.png"),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  scheme.primaryContainer,
                ],
                stops: const [
                  0.25,
                  0.40,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Labels.welcomeTo2,
                  textAlign: TextAlign.center,
                  style: style.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/google.svg",
                      width: 24,
                      height: 24,
                    ),
                    label: Text(Labels.continueWithGoogle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/facebook.svg",
                      width: 24,
                      height: 24,
                    ),
                    label: Text(Labels.continueWithFacebook),
                  ),
                ),
                Container(
                  color: theme.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(Labels.logInWithEmail),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: Labels.email,
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                             
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: Labels.password,
                              prefixIcon: Icon(Icons.lock_outline),
                            ),
                          
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
