import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';
import '../../../../language/generated/key_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldPass extends StatefulWidget {
  const FieldPass({
    Key? key,
    void Function(String? value)? valuePass,
    String? Function(String?)? onValidators = AppValidators.isPass,
    void Function(String)? onChanged,
    String? hint,
    String? helperText,
  })  : _valuePass = valuePass,
        _onValidators = onValidators,
        _onChanged = onChanged,
        _hint = hint,
        _helperText = helperText,
        super(key: key);

  @override
  _FieldPassState createState() => _FieldPassState();
  final void Function(String? value)? _valuePass;
  final String? Function(String?)? _onValidators;
  final void Function(String)? _onChanged;
  final String? _hint;
  final String? _helperText;
}

// !!!
class _FieldPassState extends State<FieldPass> {
  // * Icon
  bool _obscureText = true;
  FaIcon _iconSuffix = PathIcons.eyeIcon;
  @override
  Widget build(BuildContext context) {
    return CustomField(
      hint: widget._hint, //?.tr(),
      labelText: KeyLang.pass, //.tr(),
      helperText: widget._helperText, //?.tr(),
      isObscureText: _obscureText,
      pIcon: PathIcons.passIcon,
      sIcon: Padding(
        padding: EdgeInsets.all(10.h),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          child: _iconSuffix,
          onTap: () => _viewPass(),
        ),
      ),
      onChanged: widget._onChanged,
      onValidator: widget._onValidators,
      onSaved: widget._valuePass,
    );
  }

  // * show Password
  void _viewPass() {
    setState(() {
      if (_obscureText) {
        _iconSuffix = PathIcons.eyeSlashIcon;
        _obscureText = false;
      } else {
        _iconSuffix = PathIcons.eyeIcon;
        _obscureText = true;
      }
    });
  }
}
