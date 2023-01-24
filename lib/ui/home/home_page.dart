import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_app/ui/auth/reset_password_page.dart';
import 'package:habit_app/utils/assets.dart';
import 'package:intl/intl.dart';

import '../../utils/labels.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final scheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: scheme.primaryContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: SvgPicture.asset(
          Assets.addIcon,
          height: 24,
          width: 24,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(Labels.homepage),
        leadingWidth: kToolbarHeight + 20,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Center(
            child: CircleButton(
              child: Center(
                child: SvgPicture.asset(
                  Assets.menuIcon,
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ),
        ),
        actions: const [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(Assets.profile),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AspectRatio(
              aspectRatio: 5 / 2,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(Assets.mask),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Labels.weFirstMake,
                        style: style.titleMedium!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        Labels.anonymous,
                        style: style.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    Labels.habits.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 18 + 20 * 2 / 3),
                  child: Row(
                    children: List.generate(7, (index) {
                      return DateTime.now()
                          .add(Duration(days: index - DateTime.now().weekday));
                    })
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Card(
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat('EEE').format(e).toUpperCase(),
                                      style: style.bodySmall!.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "${e.day}",
                                      style: style.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 74,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Read A Book",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.infinity,
                  color: scheme.primaryContainer,
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 18),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        7,
                        (index) => Container(
                          height: 50,
                          margin: EdgeInsets.only(right: 6),
                          width: 50,
                          decoration: BoxDecoration(
                            color: scheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
