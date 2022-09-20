import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shagher/themes/app_colors.dart';

class AppTheme {
  // * theme is dark
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
  // * current theme Text
  static String stateTheme(BuildContext context) =>
      AppTheme.isDark(context) ? KeyLang.dark : KeyLang.light;

  // * headline1
  static TextStyle h1(BuildContext context) =>
      Theme.of(context).textTheme.headline1 ?? const TextStyle();
  // * headline2
  static TextStyle h2(BuildContext context) =>
      Theme.of(context).textTheme.headline2 ?? const TextStyle();
  // * headline3
  static TextStyle h3(BuildContext context) =>
      Theme.of(context).textTheme.headline3 ?? const TextStyle();
  // * headline4
  static TextStyle h4(BuildContext context) =>
      Theme.of(context).textTheme.headline4 ?? const TextStyle();
  // * headline5
  static TextStyle h5(BuildContext context) =>
      Theme.of(context).textTheme.headline5 ?? const TextStyle();
  // * headline6
  static TextStyle h6(BuildContext context) =>
      Theme.of(context).textTheme.headline6 ?? const TextStyle();
  // * bodyText1
  static TextStyle b1(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1 ?? const TextStyle();
  // * bodyText2
  static TextStyle b2(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2 ?? const TextStyle();
  // * subtitle1
  static TextStyle s1(BuildContext context) =>
      Theme.of(context).textTheme.subtitle1 ?? const TextStyle();
  // * subtitle2
  static TextStyle s2(BuildContext context) =>
      Theme.of(context).textTheme.subtitle2 ?? const TextStyle();
  // * button
  static TextStyle btn(BuildContext context) =>
      Theme.of(context).textTheme.button ?? const TextStyle();

  // * screen width
  static double sw(BuildContext context) => MediaQuery.of(context).size.width;
  // * screen height
  static double sh(BuildContext context) => MediaQuery.of(context).size.height;

  //  * Change Theme
  static const String _keyTheme = 'Key_Theme';

  // * set
  static Future<void> setTheme({required bool value}) async {
    final SharedPreferences _sPref = await SharedPreferences.getInstance();
    await _sPref.setBool(_keyTheme, value);
  }

  // * get
  static Future<bool> get getTheme async {
    final SharedPreferences _sPref = await SharedPreferences.getInstance();
    final bool? _theme = _sPref.getBool(_keyTheme);
    return _theme ?? false;
  }
}

// // ?? check if null
// // ! can't be null