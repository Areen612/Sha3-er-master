import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:shagher/service/restart/restart_app.dart';
import 'package:shagher/util/my_app.dart';
import 'language/config/config_language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final Locale systemLocales = window.locale;
  final Locale _defultLang = systemLocales.languageCode == 'ar'
      ? ConfigLanguage.arLocale
      : ConfigLanguage.enLocale;
  runApp(
    //GetMaterialApp(
    EasyLocalization(
      supportedLocales: const [
        ConfigLanguage.arLocale,
        ConfigLanguage.enLocale,
      ],
      path: ConfigLanguage.langPath,
      fallbackLocale: ConfigLanguage.enLocale,
      startLocale: _defultLang,
      child: const MyApp(),
    ),
  );
  //);
}

//todo upload apptheme and basic config file