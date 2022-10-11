import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

class FieldSkills extends StatelessWidget {
  const FieldSkills(
      {Key? key, required void Function(String? value)? valueSkills})
      : _valueSkills = valueSkills,
        super(key: key);
  final void Function(String? value)? _valueSkills;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      keyboardType: TextInputType.multiline,
      labelText: KeyLang.skills,
      pIcon: PathIcons.file,
      maxLines: 10,
      onSaved: _valueSkills,
      onValidator: AppValidators.isEmpty,
    );
  }
}
