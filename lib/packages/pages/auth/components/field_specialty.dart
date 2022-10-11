import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

class FieldSpecialty extends StatelessWidget {
  const FieldSpecialty(
      {Key? key, required void Function(String? value)? valueSpecialty})
      : _valueSpecialty = valueSpecialty,
        super(key: key);
  final void Function(String? value)? _valueSpecialty;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      labelText: KeyLang.specialty,
      pIcon: PathIcons.company,
      onSaved: _valueSpecialty,
      onValidator: AppValidators.isEmpty,
    );
  }
}
