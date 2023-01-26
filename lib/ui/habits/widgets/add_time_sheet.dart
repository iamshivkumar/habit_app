import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_app/main.dart';
import 'package:habit_app/utils/labels.dart';

class AddTimeSheet extends StatelessWidget {
  const AddTimeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                child: const Text(Labels.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                Labels.addReminder,
                style: style.specialTitle,
              ),
              CupertinoButton(
                child: const Text(Labels.save),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const Divider(),
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            onTimerDurationChanged: (v) {},
          ),
          Row(
            children: [
              Expanded(
                child: RawMaterialButton(
                  fillColor: scheme.primary,
                  padding: const EdgeInsets.all(16),
                  elevation: 0,
                  onPressed: () {},
                  child: Text(
                    Labels.am,
                    style: style.labelLarge,
                  ),
                ),
              ),
              Expanded(
                child: RawMaterialButton(
                  fillColor: scheme.primaryContainer,
                  padding: const EdgeInsets.all(16),
                  elevation: 0,
                  onPressed: () {},
                  child: Text(
                    Labels.pm,
                    style: style.labelLarge!.copyWith(color: scheme.primary),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
