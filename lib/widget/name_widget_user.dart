import 'package:flutter/material.dart';
import 'package:shagher/service/theme/app_theme.dart';

class NameWidgetUser extends StatelessWidget {
  const NameWidgetUser({Key? key, String? name, String? specialty})
      : _name = name,
        _specialty = specialty,
        super(key: key);
  final String? _name;
  final String? _specialty;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _name!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        const SizedBox(height: 4),
        Text(
          _specialty!,
          style: AppTheme.h6(context),
        )
      ],
    );
  }
}
