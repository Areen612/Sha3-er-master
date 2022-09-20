import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

class FieldFname extends StatelessWidget {
  const FieldFname(
      {Key? key,
      required void Function(String? value)? valueFname,
      TextEditingController? controller})
      : _valueFname = valueFname,
        _controller = controller,
        super(key: key);
  final void Function(String? value)? _valueFname;
  final TextEditingController? _controller;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      controller: _controller,
      labelText: KeyLang.fname,
      pIcon: PathIcons.nameTagIcon,
      onSaved: _valueFname,
      onValidator: AppValidators.isEmpty,
    );
  }
}
