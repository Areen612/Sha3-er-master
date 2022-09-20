import 'package:flutter/material.dart';
import 'package:shagher/service/theme/app_theme.dart';

class PostDetailsWidget extends StatelessWidget {
  const PostDetailsWidget(
      {Key? key, bool all = false, String? text, String textTheme = 'h5'})
      : _all = all,
        _text = text,
        _textTheme = textTheme,
        super(key: key);

  final bool _all;
  final String? _text;
  final String _textTheme;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: _all
            ? const EdgeInsets.all(20)
            : const EdgeInsets.symmetric(horizontal: 20),
        child: Text(_text!, style: style(context, _textTheme)),
      ),
    );
  }
}

TextStyle? style(context, textTheme) {
  switch (textTheme) {
    case 'h5':
      return AppTheme.h5(context).copyWith(fontWeight: FontWeight.w100);
    case 'h6':
      return AppTheme.h6(context).copyWith(fontWeight: FontWeight.w100);
    case 'b1':
      return AppTheme.b1(context).copyWith(fontWeight: FontWeight.w100);
  }
  return null;
}



// EdgeInsetsGeometry? padding(edgeInsets) {
//   switch (edgeInsets) {
//     case 'all':
//     case 'symmetric':
//   }
//   return null;
// }
