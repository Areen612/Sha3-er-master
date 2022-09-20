import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldCountry extends StatelessWidget {
  const FieldCountry(
      {Key? key, required void Function(String? value)? valueCountry})
      : _valueCountry = valueCountry,
        super(key: key);
  final void Function(String? value)? _valueCountry;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      labelText: KeyLang.country,
      pIcon: PathIcons.country,
      onSaved: _valueCountry,
      onValidator: AppValidators.isEmpty,
    );
  }
}
