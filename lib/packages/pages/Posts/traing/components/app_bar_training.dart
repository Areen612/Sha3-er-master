import 'package:flutter/material.dart';
import 'package:shagher/packages/components/tab_bar/tab_bar_training.dart';

class AppBarTraining extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTraining({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //actions: [IconButton(onPressed: () {}, icon: PathSvg.profileIcon)],
      bottom: const TabBarTraining(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
