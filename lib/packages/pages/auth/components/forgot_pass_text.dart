import 'package:shagher/service/lang/app_lang.dart';
import 'package:shagher/service/theme/app_theme.dart';

import '../../../../language/generated/key_lang.dart';
import '../view/forgot.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgotPassText extends StatelessWidget {
  const ForgotPassText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          AppLang.isAr(context) ? Alignment.centerLeft : Alignment.centerRight,
      child: TextButton(
        onPressed: () => _navForgot(context),
        child: Text(
          KeyLang.forgotPass.tr(),
          style: AppTheme.b1(context)
              .copyWith(decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  // * navigator Forgot
  void _navForgot(BuildContext context) =>
      Navigator.pushNamed(context, ForgotPasswordWidget.id);
}
