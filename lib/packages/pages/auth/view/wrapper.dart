import 'package:shagher/packages/components/loading/loading_page.dart';
import 'package:shagher/packages/pages/home/views/body.dart';

import 'login.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  static const String id = 'Wrapper';
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //  stream: UserAuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        }
        if (snapshot.hasData) {
          return const UserLandScape();
        }
        return const LoginWidget();
      },
    );
  }
}
