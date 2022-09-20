import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/components/button/elevated_btn.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';
import 'package:shagher/packages/pages/home/components/app_bar_home.dart';
import 'package:shagher/widget/edit_image.dart';
import 'package:shagher/widget/textfield_widget.dart';

class UserEditProfile extends StatefulWidget {
  static const id = 'UserEditProfile';
  const UserEditProfile({Key? key}) : super(key: key);

  @override
  _UserEditProfileState createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  final ModelUserAuth user = ModelUserAuth(
    firstName: 'Areen',
    lastName: 'Ali',
    email: 'areen@gmail.com',
    phoneNumber: '123-456-1234',
    specialty: 'Software',
    experience: 'experience experience experience',
    skills: 'skills skills skills skills skills skills skills',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
  );
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: const AppBarHome(),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 40),
              EditableImage(
                imagePath: user.imageUrl,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: KeyLang.userName.tr(),
                text: user.getFullName(),
                onChanged: (name) {
                  user.setFullName(name);
                },
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: KeyLang.specialty.tr(),
                text: user.specialty!,
                onChanged: (specialty) {
                  user.specialty = specialty;
                },
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: KeyLang.skills.tr(),
                text: user.skills!,
                onChanged: (skills) {
                  user.skills = skills;
                },
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                  label: KeyLang.experience.tr(),
                  text: user.experience!,
                  maxLines: 5,
                  onChanged: (about) {
                    user.experience = about;
                  }),
              const SizedBox(height: 88),
              ElevatedBtn(
                // TODO: tr()
                title: 'Save changes',
                onTap: () {},
                width: 300,
              ),
              const SizedBox(height: 88),
            ],
          ),
        ),
      );
}
