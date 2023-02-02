import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/labels.dart';
import '../providers/auth_provider.dart';



class PasswordField extends ConsumerWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(authProvider);
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(authProvider.select((value) => value.obscureText));
        return TextFormField(
          obscureText: model.obscureText,
          initialValue: model.password,
          style: TextStyle(
            color: scheme.primary,
          ),
          decoration: InputDecoration(
            hintText: Labels.password,
            prefixIcon: Icon(Icons.lock_outline),
            suffix: GestureDetector(
              onTap: () => model.obscureText = !model.obscureText,
              child: Text(
                Labels.show,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          onChanged: (value) => model.password = value,
        );
      },
    );
  }
}
