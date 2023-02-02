import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/labels.dart';
import '../../../utils/validators.dart';
import '../providers/auth_provider.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(authProvider);
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: model.email,
      style: TextStyle(
        color: scheme.primary,
      ),
      decoration: InputDecoration(
        hintText: Labels.email,
        prefixIcon: Icon(Icons.email_outlined),
      ),
      validator: Validators.validateEmail,
      onChanged: (value) => model.email = value,
    );
  }
}
