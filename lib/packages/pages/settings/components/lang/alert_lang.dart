import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shagher/language/config/config_language.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/components/button/outlined_btn.dart';
import 'package:shagher/packages/pages/settings/components/lang/flag_lang.dart';
import 'package:shagher/util/path_images.dart';
//import 'package:shagher/util/path_svg.dart';

//TODO:
class AlertLang extends StatelessWidget {
  const AlertLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // * Title Alert
      title: const Text(
        KeyLang.selectLanguage,
        textAlign: TextAlign.center,
      ).tr(),
      // * Body Alert
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 120.h,
        child: Column(
          children: const [
            FlagLang(
              flag: PathImages.unitedArabEmiratesFlag,
              title: KeyLang.arabic,
              locale: ConfigLanguage.arLocale,
            ),
            FlagLang(
              flag: PathImages.unitedStatesFlag,
              title: KeyLang.english,
              locale: ConfigLanguage.enLocale,
            ),
          ],
        ),
      ),
      // * Button
      actions: [
        OutlinedBtn(title: KeyLang.cancel, onTap: () => Navigator.pop(context))
      ],
    );
  }
}
