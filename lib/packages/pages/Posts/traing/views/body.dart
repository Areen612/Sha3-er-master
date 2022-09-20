import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/Posts/traing/views/paid.dart';
import 'package:shagher/packages/pages/Posts/traing/views/unpaid.dart';
import '../components/app_bar_training.dart';

class TrainingWidget extends StatefulWidget {
  static const String id = "TrainingWidget";
  const TrainingWidget({
    Key? key,
    // required ModelPost postState,
  }) :
        //_postState = postState,
        super(key: key);

  @override
  State<TrainingWidget> createState() => _TrainingPageState();
  //final ModelPost _postState;
}

class _TrainingPageState extends State<TrainingWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // * paid
      const PaidWidget(),
      // * unpaid
      const UnpaidWidget(),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppBarTraining(),
        body: TabBarView(children: _pages),
        // drawer: const DrawerBody(),
      ),
    );
  }
}
