import 'package:flutter/cupertino.dart';
import 'package:shagher/packages/pages/Posts/company/views/add_post_widget.dart';
import 'package:shagher/packages/pages/company/views/landscape.dart';
import 'package:shagher/packages/pages/Posts/traing/views/body.dart';
import 'package:shagher/packages/pages/auth/view/cv.dart';
import 'package:shagher/packages/pages/auth/view/forgot.dart';
import 'package:shagher/packages/pages/auth/view/login.dart';
import 'package:shagher/packages/pages/auth/view/register.dart';
import 'package:shagher/packages/pages/auth/view/wrapper.dart';
import 'package:shagher/packages/pages/company/views/requests.dart';
import 'package:shagher/packages/pages/settings/views/body.dart';
import 'package:shagher/packages/pages/user/views/company_profile.dart';
import 'package:shagher/packages/pages/tour/views/body.dart';
import 'package:shagher/packages/pages/user/views/edit_profile_page.dart';
import 'package:shagher/packages/pages/user/views/user_profile.dart';
import '../packages/pages/home/views/body.dart';
import '../packages/pages/splash/views/body.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashWidget.id: (context) => const SplashWidget(),
    UserLandScape.id: (context) => const UserLandScape(),
    TrainingWidget.id: (context) => const TrainingWidget(),
    TourWidget.id: (context) => const TourWidget(),
    LoginWidget.id: (context) => const LoginWidget(),
    RegisterWidget.id: (context) => const RegisterWidget(),
    ForgotPasswordWidget.id: (context) => const ForgotPasswordWidget(),
    Wrapper.id: (context) => const Wrapper(),
    CvForm.id: (context) => const CvForm(),
    UserProfile.id: (context) => const UserProfile(),
    UserEditProfile.id: (context) => const UserEditProfile(),
    CompanyLandScape.id: (context) => const CompanyLandScape(),
    AddPostWidget.id: (context) => const AddPostWidget(),
    CompanyProfileUser.id: (context) => const CompanyProfileUser(),
    SettingsWidget.id: (context) => const SettingsWidget(),
    RequestsWidget.id: (context) => const RequestsWidget(),
  };
}
