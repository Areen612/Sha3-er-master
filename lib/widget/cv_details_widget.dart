import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(
      {Key? key, ModelUserAuth? user, String? title, String? description})
      : _user = user,
        _title = title,
        _description = description,
        super(key: key);

  final ModelUserAuth? _user;
  final String? _title;
  final String? _description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            _description!,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }
}
