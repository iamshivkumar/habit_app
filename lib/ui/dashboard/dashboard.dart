import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/home/home_page.dart';
import 'package:habit_app/ui/home/home_root.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/assets.dart';
import '../habits/write_habit_page.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(writerProvider.notifier).state = true;
        },
        child: SvgPicture.asset(
          Assets.addIcon,
          height: 24,
          width: 24,
        ),
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
