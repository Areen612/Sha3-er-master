import 'package:easy_localization/easy_localization.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

class FieldEmail extends StatelessWidget {
  const FieldEmail(
      {Key? key,
      void Function(String? value)? valueEmail,
      TextEditingController? controller})
      : _valueEmail = valueEmail,
        _controller = controller,
        super(key: key);
  final void Function(String? value)? _valueEmail;
  final TextEditingController? _controller;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      //hint: KeyLang.email.tr(),
      // !!!
      labelText: KeyLang.email.tr(),
      keyboardType: TextInputType.emailAddress,
      // pIcon: PathIcons.emailIcon,
      onValidator: AppValidators.isEmail,
      onSaved: _valueEmail,
      controller: _controller,
    );
  }
}
