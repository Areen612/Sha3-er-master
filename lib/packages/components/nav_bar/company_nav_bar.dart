import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../language/generated/key_lang.dart';
import '../../../service/theme/app_theme.dart';
import '../../../themes/app_colors.dart';

// ToDo Delete
class CompanyNavBar extends StatelessWidget {
  const CompanyNavBar(
      {Key? key, required this.selectedIndex, required this.onClick})
      : super(key: key);

  final int selectedIndex;
  final Function(int) onClick;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor:
          AppTheme.isDark(context) ? AppColors.bgWhite : AppColors.primary,
      unselectedItemColor: AppColors.bgGrey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      //type: BottomNavigationBarType.fixed,
      //elevation: 8.0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.home_filled,
            //color: widgetIndex == 0 ? AppColors.primary : AppColors.grey,
          ),
          label: KeyLang.home.tr(),
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            //color: widgetIndex == 0 ? AppColors.primary : AppColors.grey,
          ),
          //TODO: tr()
          label: 'Settings',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onClick,
    );
  }
}

// onTap: (index) {
//         onClick(index);
//       },
