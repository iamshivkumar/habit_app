// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../root.dart';
import '../../../utils/assets.dart';
import '../../../utils/labels.dart';
import '../../components/app_snackbar.dart';
import '../providers/auth_provider.dart';

class GoogleButton extends ConsumerWidget {
  const GoogleButton({super.key,this.isLogin = false});
  
  final bool isLogin;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final model = ref.read(authProvider);
    return ElevatedButton.icon(
      onPressed: () async {
        try {
          await model.signInWithGoogle();
          Navigator.pushNamedAndRemoveUntil(
              context, Root.route, (route) => false);
        } catch (e) {
          AppSnackBar.error(context, e);
        }
      },
      icon: SvgPicture.asset(
        Assets.google,
        width: 24,
        height: 24,
      ),
      label:  Text(isLogin? Labels.continueWithGoogle: Labels.google),
    );
  }
}
