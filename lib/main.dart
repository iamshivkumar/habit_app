import 'package:flutter/material.dart';
import 'package:habit_app/ui/auth/login_page.dart';
import 'package:habit_app/ui/auth/reset_password_page.dart';
import 'package:habit_app/ui/auth/sign_up_page.dart';
import 'package:habit_app/ui/colors.dart';
import 'package:habit_app/ui/dashboard/dashboard.dart';
import 'package:habit_app/ui/home/home_page.dart';
import 'package:habit_app/ui/splash/splash_page.dart';
import 'package:habit_app/utils/constants.dart';
import 'package:habit_app/utils/labels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(seedColor: AppColors.orange).copyWith(
        primary: AppColors.orange,
        onPrimary: AppColors.textColor,
        primaryContainer: AppColors.lightOrange,
        outline: AppColors.lightText,
        surfaceVariant: AppColors.gray);
    final base = ThemeData.light().textTheme;
    return MaterialApp(
      title: Labels.appName,
      theme: ThemeData(
        indicatorColor: AppColors.lightText,
        dividerTheme: const DividerThemeData(thickness: 1, space: 0),
        dividerColor: scheme.primaryContainer,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.orange,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
        colorScheme: scheme,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(scheme.onPrimary),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(16),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(scheme.onPrimary),
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: scheme.surface,
          margin: EdgeInsets.zero,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: AppColors.lightText,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          fillColor: scheme.primaryContainer,
          filled: true,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: scheme.primary,
          textTheme: ButtonTextTheme.primary,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        textTheme: base
            .apply(fontFamily: Constants.manrope)
            .copyWith(
              headlineLarge: const TextStyle(fontFamily: Constants.klasik),
              headlineMedium: const TextStyle(
                fontFamily: Constants.klasik,
                fontSize: 32,
              ),
              headlineSmall: const TextStyle(fontFamily: Constants.klasik),
              titleMedium: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: Constants.manrope),
              labelLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: Constants.manrope,
                fontSize: 17,
              ),
              bodyLarge: const TextStyle(
                fontFamily: Constants.manrope,
                fontSize: 16,
              ),
            )
            .apply(
              bodyColor: AppColors.textColor,
              displayColor: AppColors.textColor,
            )
            .copyWith(
              bodySmall: const TextStyle(
                color: AppColors.lightText,
              ),
            ),
      ),
      home: const Dashboard(),
    );
  }
}

extension CustomStyles on TextTheme {
  TextStyle? get specialTitle => titleMedium?.copyWith(fontSize: 18);
}

// class AppStyles {
//  static TextStyle get title => const TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//       );
// }
