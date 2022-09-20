import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';

import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';

class FieldCity extends StatelessWidget {
  const FieldCity(
      {Key? key,
      required void Function(String? value)? valueCity,
      TextEditingController? controller})
      : _valueCity = valueCity,
        _controller = controller,
        super(key: key);
  final void Function(String? value)? _valueCity;
  final TextEditingController? _controller;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      labelText: KeyLang.city,
      pIcon: PathIcons.country,
      onSaved: _valueCity,
      onValidator: AppValidators.isEmpty,
    );
  }
}
