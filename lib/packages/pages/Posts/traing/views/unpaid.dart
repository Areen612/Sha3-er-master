import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';

class UnpaidWidget extends StatefulWidget {
  const UnpaidWidget({Key? key}) : super(key: key);

  @override
  State<UnpaidWidget> createState() => _PaidWidgetState();
}

class _PaidWidgetState extends State<UnpaidWidget> {
  @override
  Widget build(BuildContext context) {
    final postsList = Provider.of<List<ModelPost>>(context);
    return ListView.builder(
      itemCount: postsList.length,
      itemBuilder: (context, index) {
        return PostCard(data: postsList[index]);
      },
    );
  }
}
