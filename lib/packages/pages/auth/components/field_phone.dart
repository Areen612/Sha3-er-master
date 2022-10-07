import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

class FieldMobileNumber extends StatelessWidget {
  const FieldMobileNumber(
      {Key? key,
      required void Function(String? value)? valuePhone,
      TextEditingController? controller})
      : _valuePhone = valuePhone,
        _controller = controller,
        super(key: key);
  final void Function(String? value)? _valuePhone;
  final TextEditingController? _controller;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      initValue: '+962',
      pIcon: PathIcons.phone,
      labelText: KeyLang.mobilenumber,
      keyboardType: TextInputType.number,
      onValidator: AppValidators.isNum,
      onSaved: _valuePhone,
      controller: _controller,
    );
  }
}
