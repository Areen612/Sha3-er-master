import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shagher/packages/components/nav_bar/user_nav_bar.dart';
import 'package:shagher/packages/pages/Posts/job/body.dart';
import 'package:shagher/packages/pages/Posts/traing/views/body.dart';
import 'package:shagher/packages/pages/home/components/app_bar_home.dart';
import 'package:shagher/packages/pages/settings/views/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLandScape extends StatefulWidget {
  static const String id = "UserLandScape";
  const UserLandScape({Key? key}) : super(key: key);

  @override
  State<UserLandScape> createState() => _UserLandScapeState();
}

class _UserLandScapeState extends State<UserLandScape> {
  String? email;
  bool isVerified = true;
  SharedPreferences? prefs;
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text('home')),
    const JobsWidget(),
    const TrainingWidget(),
    const SettingsWidget()
  ];

  @override
  void initState() {
    super.initState();

    email = FirebaseAuth.instance.currentUser!.email;
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    setSharedPreferences();
  }

  setSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      body: Container(
        child: Column(
          children: [
            Visibility(
              visible: !isVerified,
              child: Container(
                height: 40,
                width: double.infinity,
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Please verify your email address",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onTap: () async {
                          await FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: _widgetOptions[_selectedIndex]),
          ],
        ),
      ),
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
        