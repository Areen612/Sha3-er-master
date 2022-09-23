import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:shagher/service/theme/app_theme.dart';

class NameWidgetCompany extends StatelessWidget {
  const NameWidgetCompany({Key? key, ModelCompanyAuth? company})
      : _company = company,
        super(key: key);

  final ModelCompanyAuth? _company;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _company!.companyName!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        const SizedBox(height: 4),
        Text(
          _company!.specialty!,
          style: AppTheme.h6(context),
        )
      ],
    );
  }
}
