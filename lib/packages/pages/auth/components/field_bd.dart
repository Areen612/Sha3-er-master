import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/packages/pages/auth/components/field_decoration.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

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
        //pIcon: PathIcons.calender,
        labelText: KeyLang.birthday.tr(),
      ),
      onSaved: _valueBd,
    );
  }
}
