import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

class FieldLname extends StatelessWidget {
  const FieldLname(
      {Key? key,
      required void Function(String? value)? valueLname,
      TextEditingController? controller})
      : _valueLname = valueLname,
        _controller = controller,
        super(key: key);
  final TextEditingController? _controller;
  final void Function(String? value)? _valueLname;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      labelText: KeyLang.lname,
      pIcon: PathIcons.nameTagIcon,
      onSaved: _valueLname,
      onValidator: AppValidators.isEmpty,
    );
  }
}
