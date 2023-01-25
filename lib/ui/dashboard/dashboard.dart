import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/home/home_page.dart';

import '../../utils/assets.dart';
import '../habits/write_habit_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WriteHabitPage(),
            ),
          );
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
        const HomePage(),
      ][0],
    );
  }
}
