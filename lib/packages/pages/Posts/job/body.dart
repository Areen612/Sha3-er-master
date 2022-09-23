import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/Posts/components/post_card.dart';
import 'package:shagher/packages/pages/Posts/models/post.dart';

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
  List<ModelPost> card = [];
  @override
  void initState() {
    super.initState();
    card.add(ModelPost(
      id: '0',
      title: 'Company',
      requirements: 'req',
      // rangeSalary: '500-600',
    ));
    card.add(ModelPost(
      id: '7',
      title: 'Company',
      requirements: 'req',
      // rangeSalary: '500-600',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: ListView.builder(
          itemCount: card.length,
          itemBuilder: (context, index) {
            return PostCard(data: card[index]);
          },
        ),
        //drawer: const DrawerBody(),
      ),
    );
  }
}
