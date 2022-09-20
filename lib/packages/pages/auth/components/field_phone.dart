import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldPhoneNumber extends StatelessWidget {
  const FieldPhoneNumber(
      {Key? key, required void Function(String? value)? valuePhone})
      : _valuePhone = valuePhone,
        super(key: key);
  final void Function(String? value)? _valuePhone;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      initValue: '+962',
      pIcon: PathIcons.phone,
      labelText: KeyLang.mobilenumber,
      keyboardType: TextInputType.number,
      onValidator: AppValidators.isNum,
      onSaved: _valuePhone,
    );
  }
}
