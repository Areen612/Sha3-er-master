import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/components/config_material.dart';
import 'package:shagher/packages/components/errors/error_text.dart';
import 'package:shagher/packages/components/loading/loading_page.dart';
import 'package:shagher/packages/pages/Posts/manage_state/post.dart';
import 'package:shagher/packages/pages/auth/manage_state/company_service.dart';
import 'package:shagher/packages/pages/auth/manage_state/user_service.dart';
import 'package:shagher/service/restart/restart_app.dart';
import 'package:shagher/themes/change_theme.dart';
import '../packages/pages/Posts/models/post.dart';
import '../packages/pages/splash/views/body.dart';
import '../routes/app_routes.dart';
import '../service/firestore/firestore_services.dart';
import '../service/provider/post_provider.dart';
import '../themes/custom_theme.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreService = FireStoreService();
    return FutureBuilder<FirebaseApp>(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ConfigMaterial(child: LoadingPage());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return RestartWidget(
                child: MultiProvider(
              providers: [
                //ChangeNotifierProvider(create: (context) => SharedVariables()),
                ChangeNotifierProvider(create: (context) => ThemeChange()),
                ChangeNotifierProvider(create: (contex) => ManageStatePost()),
                ChangeNotifierProvider(create: (context) => UserAuthService()),
                ChangeNotifierProvider(
                    create: (context) => CompanyAuthService()),
                ChangeNotifierProvider(create: (context) => PostProvider()),
                StreamProvider<User?>.value(
                    value: FirebaseAuth.instance.authStateChanges(),
                    initialData: null
                    //   var user = Provider.of<FirebaseUser>(context);
                    ),
                StreamProvider<List<ModelPost>>.value(
                    value: firestoreService.getPosts(), initialData: const [])
              ],
              child: Builder(builder: (context) {
                final ThemeChange _themeProvider =
                    Provider.of<ThemeChange>(context);
                _themeProvider.updateThemeShared();
                return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  builder: (BuildContext context, child) => MaterialApp(
                    title: 'Sha3\'r',
                    theme: CustomTheme.lightTheme(context),
                    darkTheme: CustomTheme.darkTheme(context),
                    themeMode: _themeProvider.themeModel,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    debugShowCheckedModeBanner: false,
                    scrollBehavior: AppScrollBehavior(),
                    initialRoute: SplashWidget.id,
                    routes: AppRoutes.routes,
                  ),
                );
              }),
            ));
          } else {
            return const ConfigMaterial(
                child: ErrorText(titleError: KeyLang.errorNoData));
          }
        } else {
          return const ConfigMaterial(
              child: ErrorText(titleError: KeyLang.errorInitFirebase));
        }
      },
    );
  }
}
