import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/Posts/controllers/post.dart';

class UnpaidWidget extends StatefulWidget {
  const UnpaidWidget({Key? key}) : super(key: key);

  @override
  State<UnpaidWidget> createState() => _PaidWidgetState();
}

class _PaidWidgetState extends State<UnpaidWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ControllerPosts.dataLength,
      itemBuilder: (context, index) {
        return PostCard(data: ControllerPosts.getPosts(index));
      },
    );
  }
}
