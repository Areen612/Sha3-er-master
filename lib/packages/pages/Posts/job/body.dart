import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shagher/controller/job_controller.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';

class JobsWidget extends StatefulWidget {
  static const String id = "JobsWidget";
  const JobsWidget({
    Key? key,
    // required ModelPost postState,
  }) :
        //_postState = postState,
        super(key: key);

  @override
  State<JobsWidget> createState() => _JobsPageState();
  //final ModelPost _postState;
}

class _JobsPageState extends State<JobsWidget> {
  @override
  Widget build(BuildContext context) {
    //final postProvider = Provider.of<PostProvider>(context);
    //  final postsList = Provider.of<List<ModelPost>>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: GetX<PostControlleer>(
            init: Get.put(PostControlleer()),
            builder: (_con) {
              return ListView.builder(
                itemCount: _con.getjobList.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    data: _con.getjobList[index],
                    index: index,
                  );
                },
              );
            }),
        //drawer: const DrawerBody(),
      ),
    );
  }
}
