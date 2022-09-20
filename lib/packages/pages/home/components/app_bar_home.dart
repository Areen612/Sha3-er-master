import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/home/components/search_bar.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.4,
      actions: [
        IconButton(
          onPressed: () {
            // method to show the search bar
            showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate());
          },
          icon: const Icon(Icons.search),
        )
      ],
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     iconSize: 30,
      //     padding: AppLang.currentLang(context) == 'en'
      //         ? const EdgeInsets.only(right: 20)
      //         : const EdgeInsets.only(left: 20),
      //     icon: Image.asset(PathImages.profileImage),
      //   )
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
