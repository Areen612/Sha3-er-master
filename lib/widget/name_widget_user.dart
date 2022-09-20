import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';
import 'package:shagher/service/theme/app_theme.dart';

class NameWidgetUser extends StatelessWidget {
  const NameWidgetUser({Key? key, ModelUserAuth? user})
      : _user = user,
        super(key: key);

  final ModelUserAuth? _user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _user!.getFullName(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        const SizedBox(height: 4),
        Text(
          _user!.specialty!,
          style: AppTheme.h6(context),
        )
      ],
    );
  }
}
