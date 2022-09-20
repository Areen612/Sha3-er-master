import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SBW extends StatelessWidget {
  const SBW({Key? key, double w = 10})
      : _width = w,
        super(key: key);
  final double _width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width.w,
    );
  }
}
