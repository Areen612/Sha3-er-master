import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({Key? key, String? title, String? description})
      : _title = title,
        _description = description,
        super(key: key);
  final String? _title;
  final String? _description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _title!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          _description!,
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    );
  }
}
