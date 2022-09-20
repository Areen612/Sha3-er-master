import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';

class RequestsWidget extends StatefulWidget {
  static const String id = 'requests';
  const RequestsWidget({Key? key}) : super(key: key);

  @override
  State<RequestsWidget> createState() => PaidWidgetState();
}

class PaidWidgetState extends State<RequestsWidget> {
  static List<ModelPost> users = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return const ListTile();
      },
    );
  }
}
