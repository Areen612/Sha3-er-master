import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shagher/service/lang/app_lang.dart';
import 'package:shagher/service/restart/restart_app.dart';

class FlagLang extends StatelessWidget {
  const FlagLang({
    Key? key,
    required String flag,
    required String title,
    required Locale locale,
  })  : _flag = flag,
        _title = title,
        _locale = locale,
        super(key: key);

  final String _flag;
  final String _title;
  final Locale _locale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () async {
          if (_locale.languageCode == AppLang.currentLang(context)) {
            Navigator.pop(context);
          } else {
            await EasyLocalization.of(context)?.setLocale(_locale);
            RestartWidget.restartApp(context);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // * Flag
            Expanded(
              //flex: 5,
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_flag),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                _title.tr(),
                // textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
