import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shagher/controller/job_controller.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';

class UnpaidWidget extends StatefulWidget {
  const UnpaidWidget({Key? key}) : super(key: key);

  @override
  State<UnpaidWidget> createState() => _PaidWidgetState();
}

class _PaidWidgetState extends State<UnpaidWidget> {
  @override
  Widget build(BuildContext context) {
    // final postsList = Provider.of<List<ModelPost>>(context);
    return GetX<PostControlleer>(
        init: Get.put(PostControlleer()),
        builder: (_con) {
          return ListView.builder(
            itemCount: _con.getUpPaidTraining.length,
            itemBuilder: (context, index) {
              return PostCard(
                data: _con.getUpPaidTraining[index],
                index: index,
              );
            },
          );
        });
  }
}
