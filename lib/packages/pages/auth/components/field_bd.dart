import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/packages/pages/auth/components/field_decoration.dart';
import 'package:shagher/service/theme/app_theme.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldBirthday extends StatelessWidget {
  const FieldBirthday(
      {Key? key, required void Function(DateTime? value)? valueBd})
      : _valueBd = valueBd,
        super(key: key);
  final void Function(DateTime? value)? _valueBd;

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      mode: DateTimeFieldPickerMode.date,
      decoration: fieldDecoration(
        context,
        pIcon: PathIcons.calender,
        labelText: KeyLang.birthday.tr(),
      ),
      onSaved: _valueBd,
    );
  }
}
