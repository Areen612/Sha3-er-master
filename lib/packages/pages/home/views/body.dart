import 'package:flutter/material.dart';
import 'package:shagher/packages/components/nav_bar/user_nav_bar.dart';
import 'package:shagher/packages/pages/Posts/job/body.dart';
import 'package:shagher/packages/pages/Posts/traing/views/body.dart';
import 'package:shagher/packages/pages/home/components/app_bar_home.dart';
import 'package:shagher/packages/pages/settings/views/body.dart';

class UserLandScape extends StatefulWidget {
  static const String id = "UserLandScape";
  const UserLandScape({Key? key}) : super(key: key);

  @override
  State<UserLandScape> createState() => _UserLandScapeState();
}

class _UserLandScapeState extends State<UserLandScape> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text('home')),
    const JobsWidget(),
    const TrainingWidget(),
    const SettingsWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      body: _widgetOptions[_selectedIndex],
      //drawer: const DrawerBody(),
      bottomNavigationBar: UserNavBar(
        selectedIndex: _selectedIndex,
        onClick: (calledIndex) {
          setState(() {
            _selectedIndex = calledIndex;
          });
        },
      ),
    );
  }

  // getAppBar() =>
  //     _selectedIndex == 2 ? const AppBarTraining() : const AppBarHome();
}
        //onTap: _onItemTapped,
        //currentIndex: _selectedIndex,
        