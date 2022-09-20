import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/themes/app_colors.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Text(
          KeyLang.appName.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: AppColors.blueGrey),
        )));
  }
}

// class NavBarPage extends StatefulWidget {
//   NavBarPage({Key key, this.initialPage}) : super(key: key);

//   final String initialPage;

//   @override
//   _NavBarPageState createState() => _NavBarPageState();
// }

// /// This is the private State class that goes with NavBarPage.
// class _NavBarPageState extends State<NavBarPage> {
//   String _currentPage = 'UserHomePage';

//   @override
//   void initState() {
//     super.initState();
//     _currentPage = widget.initialPage ?? _currentPage;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final tabs = {
//       'JobsPage': JobsPageWidget(),
//       'UserHomePage': UserHomePageWidget(),
//       'TrainingPage': TrainingPageWidget(),
//     };
//     final currentIndex = tabs.keys.toList().indexOf(_currentPage);
//     return Scaffold(
//       body: tabs[_currentPage],
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: currentIndex,
//           onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
//           backgroundColor: Colors.white,
//           // selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
//           unselectedItemColor: Color(0xFFC2C0C0),
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           items: <BottomNavigationBarItem>[
//             const BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.work_outline_rounded,
//                 size: 24,
//               ),
//               activeIcon: Icon(
//                 Icons.work,
//                 size: 30,
//               ),
//               label: '1nacagi5' /* Job */,
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home_outlined,
//                 size: 24,
//               ),
//               activeIcon: Icon(
//                 Icons.home,
//                 size: 30,
//               ),
//               label: '2g8dsex5' /* Home */,
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.school_outlined,
//                 size: 24,
//               ),
//               activeIcon: Icon(
//                 Icons.school_rounded,
//                 size: 30,
//               ),
//               label: '83dxk1lx' /* Training */,
//             ),
//           ]),
//     );
//   }
// }
