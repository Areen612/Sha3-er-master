import 'package:flutter/material.dart';
import 'package:shagher/packages/pages/company/views/add_post_widget.dart';
import 'package:shagher/packages/pages/company/views/home.dart';
import 'package:shagher/packages/pages/settings/views/body.dart';
import 'package:shagher/service/lang/app_lang.dart';
import 'package:shagher/themes/app_colors.dart';

class CompanyLandScape extends StatefulWidget {
  static const String id = "CompanyLandScape";
  const CompanyLandScape({Key? key}) : super(key: key);

  @override
  State<CompanyLandScape> createState() => _CompanyLandScapeState();
}

class _CompanyLandScapeState extends State<CompanyLandScape> {
  // int _selectedIndex = 0;
  // static final List<Widget> _widgetOptions = <Widget>[
  //   const CompanyHomeWidget(),
  //   const SettingsWidget(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // InkWell(
          //     onTap: () => Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //             builder: (context) => const SettingsWidget())),
          //     child: const Icon(Icons.abc_sharp)),
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const SettingsWidget())),
            iconSize: 30,
            padding: AppLang.currentLang(context) == 'en'
                ? const EdgeInsets.only(right: 20)
                : const EdgeInsets.only(left: 20),
            icon: Image.network(
                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
          )
        ],
      ),
      body: const CompanyHomeWidget(),

      //_widgetOptions[_selectedIndex],
      //drawer: const DrawerBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => _navAddPost(context),
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: CompanyNavBar(
      //   selectedIndex: _selectedIndex,
      //   onClick: (calledIndex) {
      //     setState(() {
      //       _selectedIndex = calledIndex;
      //     });
      //   },
      // ),
    );
  }

  void _navAddPost(BuildContext context) =>
      Navigator.pushNamed(context, AddPostWidget.id);
  void _navSettings(BuildContext context) =>
      Navigator.pushNamed(context, SettingsWidget.id);
}
