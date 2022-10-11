import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
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
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final ModelUserAuth dumUser = ModelUserAuth(
    firstName: 'Areen',
    lastName: 'Ali',
    email: 'areen@gmail.com',
    specialty: 'Software Engineer',
    mobileNumber: '123-456-1234',
    experience:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
    skills: 'skill1 skill2 skill3 skill4\n skill5 skill6 skill7',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
  );
  ModelUserAuth loggedInUser = ModelUserAuth();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      var docId = value.id;
      loggedInUser = ModelUserAuth.fromMap(value.data()!);
      loggedInUser.setId(docId);
      print('dataaa $loggedInUser');
      print('geee ' + loggedInUser.firstName!);
      print('geee ${loggedInUser.experience}');
      print('geee ${loggedInUser.skills}');
      //print('geee ${loggedInUser.specialty}');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //  User? user = _auth.userData;
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
                          //Navigator.
                          //UserEditProfile(document: snapshot.data,);
                          // Navigator.pushNamed(context, UserEditProfile.id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserEditProfile(document: loggedInUser)));
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

              NameWidgetUser(
                name: loggedInUser.firstName!,
                specialty: loggedInUser.specialty!,
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              //TODO: stat
              const StatisticWidget(),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: DetailsWidget(
                  title: KeyLang.experience.tr(),
                  description: loggedInUser.experience,
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: DetailsWidget(
                  title: KeyLang.skills.tr(),
                  description: loggedInUser.skills,
                ),
              ),
              const SizedBox(height: 88),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: ElevatedBtn(
                  // TODO: tr()
                  title: 'CV',
                  onTap: () async {
                    final cvId = await FlutterDownloader.enqueue(
                      url: 'your download link',
                      headers: {}, // optional: header send with url (auth token etc)
                      savedDir:
                          'the path of directory where you want to save downloaded files',
                      showNotification:
                          true, // show download progress in status bar (for Android)
                      openFileFromNotification:
                          true, // click on notification to open downloaded file (for Android)
                    );
                  },
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
