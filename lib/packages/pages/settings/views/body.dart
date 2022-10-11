import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/pages/auth/manage_state/company_service.dart';
import 'package:shagher/packages/pages/auth/view/login.dart';
import 'package:shagher/packages/pages/settings/components/lang/alert_lang.dart';
import 'package:shagher/packages/pages/user/views/user_profile.dart';
import 'package:shagher/service/lang/app_lang.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/themes/change_theme.dart';

class SettingsWidget extends StatefulWidget {
  static const id = 'SettingsWidget';
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  String _themeText = KeyLang.light;
  @override
  Widget build(BuildContext context) {
    final ThemeChange _themeProvider = Provider.of<ThemeChange>(context);
    _themeText = AppTheme.isDark(context) ? KeyLang.dark : KeyLang.light;
    final CompanyAuthService _auth = Provider.of<CompanyAuthService>(context);
    return Scaffold(
      body: ListView(
        //padding: const EdgeInsets.only(top: 40),
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
              title: Text(KeyLang.userProfile.tr()),
              //minVerticalPadding: 40,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              //onTap: () => Get.to('/$UserProfile.id'),
              onTap: () => _navProfile(context),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(KeyLang.language.tr()),
              subtitle: AppLang.isAr(context)
                  ? Text(KeyLang.arabic.tr())
                  : Text(KeyLang.english.tr()),
              contentPadding: AppLang.isAr(context)
                  ? const EdgeInsets.only(right: 40)
                  : const EdgeInsets.only(left: 40),
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const AlertLang(),
                );
              },
              //trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: AppTheme.isDark(context)
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
              title: Text(_themeText.tr()),
              trailing: Padding(
                padding: AppLang.isAr(context)
                    ? const EdgeInsets.only(left: 15)
                    : const EdgeInsets.only(right: 15),
                child: Switch(
                  activeColor: AppColors.primary,
                  value: _themeProvider.isDark,
                  onChanged: (value) async {
                    _themeProvider.updateTheme = value;
                    await AppTheme.setTheme(value: value);
                  },
                ),
              ),
              contentPadding: AppLang.isAr(context)
                  ? const EdgeInsets.only(right: 40)
                  : const EdgeInsets.only(left: 40),
              //trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(KeyLang.logout.tr()),
              contentPadding: AppLang.isAr(context)
                  ? const EdgeInsets.only(right: 40)
                  : const EdgeInsets.only(left: 40),
              //onTap: _auth.signOut,
              onTap: () {
                _auth.signOut();
                Navigator.pushNamed(context, LoginWidget.id);
              },
              //style: ListTileStyle.list,
              // trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ).toList(),
      ),
    );
  }
}

void _navProfile(BuildContext context) =>
    Navigator.pushNamed(context, UserProfile.id);
