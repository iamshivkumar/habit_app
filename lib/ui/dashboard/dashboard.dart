import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/components/app_snackbar.dart';
import 'package:habit_app/ui/habits/providers/write_habit_view_model_provider.dart';
import 'package:habit_app/ui/home/home_root.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/assets.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final writer = ref.watch(writerProvider);
          final notifer = ref.read(writerProvider.notifier);
          return FloatingActionButton(
            onPressed: () async {
              final model = ref.read(writeHabitViewModelProvider);

              if (writer) {
                if (model.formKey.currentState!.validate()) {
                  model.formKey.currentState!.save();
                  try {
                    await model.write();
                    notifer.state = false;
                  } catch (e) {
                    AppSnackBar.error(context, e);
                  }
                }
              } else {
                notifer.state =true;
              }
            },
            child: writer
                ? SvgPicture.asset(
                    Assets.check,
                    height: 24,
                  )
                : SvgPicture.asset(
                    Assets.addIcon,
                    height: 24,
                    width: 24,
                  ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.home,
                  // height: 24,
                  // width: 24,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.courses,
                  // height: 24,
                  // width: 24,
                ),
              ),
              const SizedBox(width: 44),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.community,
                  // height: 24,
                  // width: 24,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.settings,
                  // height: 24,
                  // width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      body: [
        const HomeRoot(),
      ][0],
    );
  }
}
