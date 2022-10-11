import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shagher/controller/job_controller.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';

class PaidWidget extends StatefulWidget {
  const PaidWidget({Key? key}) : super(key: key);

  @override
  State<PaidWidget> createState() => PaidWidgetState();
}

class PaidWidgetState extends State<PaidWidget> {
  static List<ModelPost> cards = [];

  @override
  void initState() {
    super.initState();
    cards.add(ModelPost(
        id: '0',
        title: 'Company 1',
        requirements: 'flutter developer',
        rangeSalary: '400-600',
        type: 'paid'));
    cards.add(ModelPost(
        id: '7',
        title: 'Company 2',
        requirements: 'database adiminstaror',
        rangeSalary: '500-600',
        type: 'paid'));
  }

  @override
  Widget build(BuildContext context) {
    // final postProvider = Provider.of<PostProvider>(context);
    return GetX<PostControlleer>(
        init: Get.put(PostControlleer()),
        builder: (_con) {
          return ListView.builder(
            itemCount: _con.getPaidTraining.length,
            itemBuilder: (context, index) {
              return PostCard(
                data: _con.getPaidTraining[index],
                index: index,
              );
            },
          );
        });
    // final postsList = Provider.of<List<ModelPost>>(context);
    // return ListView.builder(
    //   itemCount: postsList.length,
    //   itemBuilder: (context, index) {
    //     return PostCard(data: postsList[index]);
    //   },
    // );
  }
}
