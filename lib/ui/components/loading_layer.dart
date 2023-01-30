import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/loading_provider.dart';

class LoadingLayer extends StatelessWidget {
  const LoadingLayer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Stack(
      children: [
        child,
        Consumer(
          builder: (context, ref, child) {
            final loading = ref.watch(loadingProvider);
            return loading.loading
                ? Material(
                    color: scheme.primary.withOpacity(0.2),
                    child: const SafeArea(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : const SizedBox();
          },
        )
      ],
    );
  }
}
