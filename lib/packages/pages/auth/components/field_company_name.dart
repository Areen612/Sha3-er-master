import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldCompanyName extends StatelessWidget {
  const FieldCompanyName(
      {Key? key, required void Function(String? value)? valueCompanyName})
      : _valueCompanyName = valueCompanyName,
        super(key: key);
  final void Function(String? value)? _valueCompanyName;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      labelText: KeyLang.companyname,
      pIcon: PathIcons.nameTagIcon,
      onSaved: _valueCompanyName,
      onValidator: AppValidators.isEmpty,
    );
  }
}
