import '../../../themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key, required String titleError})
      : _titlError = titleError,
        super(key: key);
  final String _titlError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _titlError.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: AppColors.bgRed),
        ),
      ),
    );
  }
}
