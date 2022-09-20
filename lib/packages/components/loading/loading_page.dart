import 'package:flutter/material.dart';

import 'app_loading.dart';
import 'enum_loading.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLoading(chooseLoading: ChooseLoading.page),
      ),
    );
  }
}
