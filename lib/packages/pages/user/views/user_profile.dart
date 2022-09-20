import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/components/button/elevated_btn.dart';
import 'package:shagher/packages/components/image/cache_user.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';
import 'package:shagher/packages/pages/home/components/app_bar_home.dart';
import 'package:shagher/packages/pages/user/views/edit_profile_page.dart';
import 'package:shagher/themes/app_colors.dart';
import 'package:shagher/widget/cv_details_widget.dart';
import 'package:shagher/widget/name_widget_user.dart';
import 'package:shagher/widget/numbers_widget.dart';

class UserProfile extends StatefulWidget {
  static const id = 'UserProfile';
  const UserProfile({Key? key, ModelUserAuth? user})
      : _user = user,
        super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
  final ModelUserAuth? _user;
}

class _UserProfileState extends State<UserProfile> {
  final ModelUserAuth user = ModelUserAuth(
    firstName: 'Areen',
    lastName: 'Ali',
    email: 'areen@gmail.com',
    specialty: 'Software Engineer',
    phoneNumber: '123-456-1234',
    experience:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    skills: 'skill1 skill2 skill3 skill4\n skill5 skill6 skill7',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Scaffold(
          appBar: const AppBarHome(),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.grey,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, UserEditProfile.id);
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const CachedUser(
                height: 128,
                width: 128,
              ),
              const SizedBox(height: 24),
              NameWidgetUser(user: user),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              const StatisticWidget(),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 48),
              DetailsWidget(
                user: user,
                title: KeyLang.experience.tr(),
                description: user.experience,
              ),
              const SizedBox(height: 48),
              DetailsWidget(
                user: user,
                title: KeyLang.skills.tr(),
                description: user.skills,
              ),
              const SizedBox(height: 88),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: ElevatedBtn(
                  // TODO: tr()
                  title: 'CV',
                  onTap: () {},
                  width: 300,
                ),
              ),
              const SizedBox(height: 88),
            ],
          ),
        ),
      ),
    );
  }
}
