import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

class FieldEmail extends StatelessWidget {
  const FieldEmail(
      {Key? key, required void Function(String? value)? valueEmail})
      : _valueEmail = valueEmail,
        super(key: key);
  final void Function(String? value)? _valueEmail;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      //hint: KeyLang.email.tr(),
      // !!!
      labelText: KeyLang.email, //.tr(),
      keyboardType: TextInputType.emailAddress,
      // pIcon: PathIcons.emailIcon,
      onValidator: AppValidators.isEmail,
      onSaved: _valueEmail,
    );
  }
}
