import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/auth/components/field_decoration.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {Key? key,
      String? initValue,
      Color cursorColor = Colors.lightBlueAccent,
      TextInputType? keyboardType,
      bool isObscureText = false,
      String? hint,
      Widget? pIcon,
      Widget? sIcon,
      Widget? lable,
      String? labelText,
      String? helperText,
      EdgeInsets? contentPadding,
      int? maxLines = 1,
      int? minLines = 1,
      TextEditingController? controller,
      String? Function(String?)? onValidator,
      void Function(String?)? onSaved,
      void Function(String)? onChanged})
      : _initValue = initValue,
        _cursorColor = cursorColor,
        _keyboardType = keyboardType,
        _isObscureText = isObscureText,
        _hint = hint,
        _pIcon = pIcon,
        _sIcon = sIcon,
        _lable = lable,
        _labelText = labelText,
        _helperText = helperText,
        _contentPadding = contentPadding,
        _maxLines = maxLines,
        _minLines = minLines,
        _controller = controller,
        _onValidator = onValidator,
        _onSaved = onSaved,
        _onChanged = onChanged,
        super(key: key);

  final String? _initValue;
  final Color? _cursorColor;
  final TextInputType? _keyboardType;
  final bool _isObscureText;
  final TextEditingController? _controller;
  final String? Function(String?)? _onValidator;
  final void Function(String?)? _onSaved;
  final void Function(String)? _onChanged;

  // * InputDecoration
  final String? _hint;
  final Widget? _pIcon;
  final Widget? _sIcon;
  final Widget? _lable;
  final int? _maxLines;
  final int? _minLines;
  final String? _labelText;
  final String? _helperText;
  final EdgeInsets? _contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: _initValue,
      cursorColor: _cursorColor,
      keyboardType: _keyboardType,
      maxLines: _maxLines,
      minLines: _minLines,
      obscureText: _isObscureText,
      textInputAction: TextInputAction.newline,
      controller: _controller,
      validator: _onValidator,
      onSaved: _onSaved,
      onChanged: _onChanged,
      decoration: fieldDecoration(
        context,
        //pIcon: _pIcon,
        sIcon: _sIcon,
        labelText: _labelText?.tr(),
        helperText: _helperText?.tr(),
        hint: _hint?.tr(),
        contentPadding: _contentPadding,
      ),
      // decoration: InputDecoration(
      //   border: InputBorder.none,
      //   hintText: _hint?.tr(),
      //   label: _lable,
      //   labelText: _labelText?.tr(),
      //   helperText: _helperText,
      //   prefixIcon: Padding(
      //     padding: contentPadding.all(10.h),
      //     child: _pIcon,
      //   ),
      //   suffixIcon: Padding(
      //     padding: contentPadding.all(10.h),
      //     child: _sIcon,
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10.r),
      //     borderSide: BorderSide(
      //         color:
      //             AppTheme.isDark(context) ? AppColors.black : AppColors.grey),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10.r),
      //     borderSide: BorderSide(
      //         color:
      //             AppTheme.isDark(context) ? AppColors.grey : AppColors.black),
      //   ),
      //   errorBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10.r),
      //     borderSide: BorderSide(color: AppColors.ceriseRed),
      //   ),
      //   focusedErrorBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10.r),
      //     borderSide: BorderSide(color: AppColors.ceriseRed),
      //   ),
      // ),
    );
  }
}
