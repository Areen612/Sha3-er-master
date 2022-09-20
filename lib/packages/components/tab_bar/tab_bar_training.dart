import 'package:flutter/material.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/themes/app_colors.dart';

class TabBarTraining extends StatefulWidget implements PreferredSizeWidget {
  const TabBarTraining({Key? key}) : super(key: key);

  @override
  State<TabBarTraining> createState() => _TrainingTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 50);
}

class _TrainingTabBarState extends State<TabBarTraining> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      //labelColor: AppColors.primary,
      // indicator: BoxDecoration(
      //     borderRadius: BorderRadius.circular(5), // Creates border
      //     color: AppColors.primary),
      indicatorColor: AppColors.primary,
      tabs: [
        Tab(
          text: KeyLang.paid.tr(),
        ),
        Tab(
          text: KeyLang.unpaid.tr(),
        ),
      ],
    );
  }
}
