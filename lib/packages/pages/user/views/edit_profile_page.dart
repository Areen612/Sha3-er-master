import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';
import 'package:shagher/packages/pages/home/components/app_bar_home.dart';
import 'package:shagher/packages/pages/user/views/user_profile.dart';
import 'package:shagher/widget/edit_image.dart';

import '../../../components/button/simple_btn.dart';
import '../../../components/space/size_box_height.dart';
import '../../../components/text_field_form/custom_filed.dart';

class UserEditProfile extends StatefulWidget {
  static const id = 'UserEditProfile';
  final ModelUserAuth? document;
  const UserEditProfile({Key? key, this.document}) : super(key: key);

  @override
  _UserEditProfileState createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  final TextEditingController _controllerFullName = TextEditingController();
  final TextEditingController _controllerspecialty = TextEditingController();
  final TextEditingController _controllerskills = TextEditingController();
  final TextEditingController _controllerexperience = TextEditingController();

  final _keyForm = GlobalKey<FormState>();
  //String? _imageUrl;
  String? _filaName;
  @override
  // void initState() {
  //   super.initState();
  //   if (widget.document != null) {
  //     _controllerFullName.text =
  //         widget.document!.firstName!;
  //     _controllerspecialty.text = widget.document!.specialty!;
  //     _controllerexperience.text = widget.document!.experience!;
  //     _controllerskills.text = widget.document!.skills!;
  //     _imageUrl = widget.document!.imageUrl;
  //   }
  // }

  _handleSelectSource() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            padding: const EdgeInsets.all(12.0),
            child: ListView(children: [
              const Text("Choose the way to capture the image"),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () async {
                  _handleUpload(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  _handleUpload(ImageSource.gallery);
                },
              ),
            ]),
          );
        });
  }

  _handleSubmitAction() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (widget.document != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(widget.document!.id)
          .update(widget.document!.toMap());
      //Navigator.pop(context);
    }
    // !! fix this
    Navigator.pushReplacementNamed(context, UserProfile.id);
    print('weeee ${widget.document!.firstName}');
    print('booooooooooo');
  }

  _handleUpload(ImageSource source) async {
    try {
      // 1- Pick up an Image.
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);

      if (photo != null) {
        // 2- Convert from XFile to normal File.
        File file = File(photo.path);

        // 2- Get file name.
        setState(() {
          _filaName = path.basename(file.path);
        });

        // file.name => kejnerfeorfjerio
        //  path.basename => kejnerfeorfjerio.png
        // D:/image/camera/kejnerfeorfjerio.png

        // 4- Define an destination
        final destination = "images/$_filaName";
        // 5- Create ref. to Firebase Storage.
        final referance = FirebaseStorage.instance.ref(destination);
        // 6- Put a file into ref. and create it on Firebase.
        await referance.putFile(file);

        //_imageUrl = await referance.getDownloadURL();
        // 7- Close the Bottom Sheet.
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

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
                imagePath:
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                onClicked: _handleSelectSource,
              ),
              const SizedBox(height: 24),
              // TextFieldWidget(
              //   label: KeyLang.userName.tr(),
              //   text: widget.document!.firstName!,
              //   controller: _controllerFullName,
              //   onChanged: (name) {
              //     widget.document!.setFname(name);
              //   },
              // ),
              Text(
                KeyLang.userName.tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              CustomField(
                //labelText: KeyLang.userName.tr(),
                initValue: widget.document!.firstName,
                //controller: _controllerFullName,
                onChanged: (name) {
                  widget.document!.setFname(name);
                },
              ),
              const SizedBox(height: 24),
              Text(
                KeyLang.specialty.tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              CustomField(
                // labelText: KeyLang.specialty.tr(),
                //helperText: widget.document!.skills!,
                initValue: widget.document!.specialty,
                //controller: _controllerskills,
                onChanged: (specialty) {
                  widget.document!.specialty = specialty;
                },
              ),
              const SizedBox(height: 24),
              Text(
                KeyLang.skills.tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              CustomField(
                // labelText: KeyLang.skills.tr(),
                //helperText: widget.document!.skills!,
                initValue: widget.document!.skills,
                //controller: _controllerskills,
                maxLines: 10,
                onChanged: (skills) {
                  widget.document!.setSkills(skills);
                },
              ),
              // TextFieldWidget(
              //   label: KeyLang.skills.tr(),
              //   text: widget.document!.skills!,
              //   controller: _controllerskills,
              //   onChanged: (skills) {
              //     widget.document!.setSkills(skills);
              //   },
              // ),
              const SizedBox(height: 24),
              Text(
                KeyLang.experience.tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              CustomField(
                  //  labelText: KeyLang.experience.tr(),
                  maxLines: 5,
                  initValue: widget.document!.experience,
                  //controller: _controllerexperience,
                  onChanged: (experience) {
                    widget.document!.experience = experience;
                  }),
              // TextFieldWidget(
              //     label: KeyLang.experience.tr(),
              //     text: widget.document!.experience!,
              //     maxLines: 5,
              //     controller: _controllerexperience,
              //     onChanged: (experience) {
              //       widget.document!.experience = experience;
              //     }),
              const SizedBox(height: 88),
              SimpleBtn(
                btnTitle: KeyLang.uploadCv.tr(),
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    Uint8List? fileBytes = result.files.first.bytes;
                    String fileName = result.files.first.name;

                    // Upload file
                    await FirebaseStorage.instance
                        .ref('uploads/$fileName')
                        .putData(fileBytes!);
                  }
                },
              ),
              const SBH(h: 20),
              SimpleBtn(
                // TODO: tr()
                btnTitle: KeyLang.submit.tr(),
                onTap: _handleSubmitAction,
                //width: 300,
              ),
              const SizedBox(height: 88),
            ],
          ),
        ),
      );
}
