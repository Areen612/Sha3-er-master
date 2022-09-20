import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

//import '../../../language/generated/key_lang.dart';

class OutlinedBtn extends StatelessWidget {
  const OutlinedBtn(
      {Key? key, required String title, required void Function() onTap
      /*double radius = 120*/
      })
      : _title = title,
        _onTap = onTap,
        // _radius = radius,
        super(key: key);

  final String _title;
  final void Function() _onTap;
  // final double _radius;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onTap,
      child: Text(_title).tr(),
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(_radius.r),
        // ),
      ),
    );
  }
}
