import '../../../components/loading/loading_page.dart';
import 'login.dart';
import '../../home/views/body.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  static const String id = 'Wrapper';
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //     stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        }
        if (snapshot.hasData) {
          return const UserLandScape();
        } else {
          return const LoginWidget();
        }
      },
    );
  }
}
