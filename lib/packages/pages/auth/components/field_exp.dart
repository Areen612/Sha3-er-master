import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldExperience extends StatelessWidget {
  const FieldExperience(
      {Key? key, required void Function(String? value)? valueExp})
      : _valueExp = valueExp,
        super(key: key);
  final void Function(String? value)? _valueExp;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      keyboardType: TextInputType.multiline,
      labelText: KeyLang.experience,
      pIcon: PathIcons.file,
      maxLines: 10,
      onSaved: _valueExp,
      onValidator: AppValidators.isEmpty,
    );
  }
}
