import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SBH extends StatelessWidget {
  const SBH({Key? key, double h = 10})
      : _height = h,
        super(key: key);
  final double _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height.h,
    );
  }
}
