import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shagher/packages/components/button/simple_btn.dart';
import 'package:shagher/packages/pages/auth/components/field_bd.dart';
import 'package:shagher/packages/pages/auth/components/field_city.dart';
import 'package:shagher/packages/pages/auth/components/field_country.dart';
import 'package:shagher/packages/pages/auth/components/field_exp.dart';
import 'package:shagher/packages/pages/auth/components/field_phone.dart';
import 'package:shagher/packages/pages/auth/components/field_skills.dart';
import 'package:shagher/packages/pages/auth/components/field_specialty.dart';
import 'package:shagher/packages/pages/auth/manage_state/user_service.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';
import 'package:shagher/packages/pages/home/views/body.dart';
import 'package:shagher/service/theme/app_theme.dart';
import '../../../../language/generated/key_lang.dart';
import '../../../components/loading/app_loading.dart';
import '../../../components/loading/enum_loading.dart';
import '../../../components/space/size_box_height.dart';
import '../components/header_auth.dart';

class CvForm extends StatelessWidget {
  static const String id = 'CvForm';
  // * key Form
  static final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  // *  model save data
  const CvForm({Key? key, ModelUserAuth? userAuth})
      : _userAuth = userAuth,
        super(key: key);

  final ModelUserAuth? _userAuth;

  @override
  Widget build(BuildContext context) {
    final UserAuthService _auth = Provider.of<UserAuthService>(context);
    // _handleAddNewDocument() async {
    //   if (_keyForm.currentState!.validate()) {
    //     CollectionReference users =

    //     DocumentReference insertedDocument =
    //         await users.add(_userAuth!.toMap());
    //     //   {
    //     //   "firstName": _userAuth!.firstName,
    //     //   "lastName": _userAuth!.lastName,
    //     //   "emailAddress": _userAuth!.email,
    //     //   "mobileNumber": _userAuth!.phoneNumber,
    //     //   "password": _userAuth!.password,
    //     //   "platform": Platform.isAndroid ? "android" : "ios",
    //     //   "createdAt": DateTime.now()
    //     // }
    //     User? user = _auth.userData;
    //     if (!user.emailVerified) {
    //       await user.sendEmailVerification();
    //     }
    //   }
    // }

    _handleSubmitAction() async {
      if (_keyForm.currentState?.validate() ?? false) {
        _keyForm.currentState?.save();

        // Todo
        FocusScope.of(context).requestFocus(FocusNode());

        await _auth.register(data: _userAuth!);
        //await _auth.verify();

        // FirebaseFirestore.instance
        //     .collection("users")
        //     .add(_userAuth!.toMap()!);
        User? user = FirebaseAuth.instance.currentUser;
        // _userAuth!.id = user!.uid;
        _userAuth!.setRole('user');
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .set(_userAuth!.toMap());
        // //            User? user = _auth.userData;
        // if (user != null && !user.emailVerified) {
        //   await user.sendEmailVerification();
        // }
        _navHome(context);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                // * Header Auth
                const HeaderAuth(),
                // * Hint complete your cv
                Text(
                  KeyLang.fillCv.tr(),
                  textAlign: TextAlign.start,
                  style: AppTheme.s1(context).copyWith(height: 1.5),
                ),
                // * Birthdate
                const SBH(h: 20),
                FieldBirthday(valueBd: _userAuth!.setbirthDate),
                const SBH(h: 20),
                FieldSpecialty(valueSpecialty: _userAuth!.setSpecialty),
                // * Experience
                const SBH(h: 20),
                FieldExperience(valueExp: _userAuth!.setExperience),
                // FieldExperience(valueExp: _userAuth!.setExperience),
                // * Skills
                const SBH(h: 20),
                FieldSkills(valueSkills: _userAuth!.setSkills),
                // const SmartSelector(),
                // SmartSelect<String>.multiple(
                //   choiceGroupBuilder: (context, header, choices) {
                //     return StickyHeader(
                //       header: header,
                //       content: choices,
                //     );
                //   },
                // ),
                // * Phone Number
                const SBH(h: 20),
                FieldMobileNumber(valuePhone: _userAuth!.setMobileNumber),
                // * Country
                const SBH(h: 20),
                FieldCountry(valueCountry: _userAuth!.setCountry),
                // * City
                const SBH(h: 20),
                FieldCity(valueCity: _userAuth!.setCity),

                const SBH(h: 20),
                // * Button
                Center(
                    child: SimpleBtn(
                  btnTitle: KeyLang.uploadCv,
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
                )),
                const SBH(h: 20),

                Center(
                  child: _auth.isLoading
                      ? const AppLoading(chooseLoading: ChooseLoading.button)
                      : SimpleBtn(
                          btnTitle: KeyLang.register,
                          onTap: _handleSubmitAction),
                ),

                const SBH(h: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // * Navigator Home Page
  void _navHome(BuildContext context) =>
      Navigator.pushReplacementNamed(context, UserLandScape.id);
}

// class CvForm extends StatelessWidget {
//   static const String id = 'CvForm';
//   // * key Form
//   static final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
//   // *  model save data
//   const CvForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final UserAuthService _auth = Provider.of<UserAuthService>(context);

//   _handleSubmitAction() async {
//     if (_keyForm.currentState?.validate() ?? false) {
//                               _keyForm.currentState?.save();

//                               FocusScope.of(context).requestFocus(FocusNode());

//                               User? _result = await _auth.register(
//                                   data: PageRegisterState.userAuth);
//                               if (_result != null) {
//                                 Navigator.pop(context);
//                               } else {
//                                 errorToast(_auth.errorMessage);
//                               }
//                              FirebaseFirestore.instance.collection("users").doc( PageRegisterState.userAuth.id).setData( PageRegisterState.userAuth.toMap());
//                             }

//   }
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Form(
//             key: _keyForm,
//             child: Column(
//               children: [
//                 // * Header Auth
//                 const HeaderAuth(),
//                 // * Hint complete your cv
//                 Text(
//                   KeyLang.fillCv.tr(),
//                   textAlign: TextAlign.start,
//                   style: AppTheme.s1(context).copyWith(height: 1.5),
//                 ),
//                 // * Birthdate
//                 const SBH(h: 20),
//                 FieldBirthday(valueBd: PageRegisterState.userAuth.setbirthDate),
//                 // * Experience
//                 const SBH(h: 20),
//                 FieldExperience(
//                     valueExp: PageRegisterState.userAuth.setExperience),
//                 // * Skills
//                 const SBH(h: 20),
//                 FieldSkills(valueSkills: PageRegisterState.userAuth.setSkills),
//                 // const SmartSelector(),
//                 // SmartSelect<String>.multiple(
//                 //   choiceGroupBuilder: (context, header, choices) {
//                 //     return StickyHeader(
//                 //       header: header,
//                 //       content: choices,
//                 //     );
//                 //   },
//                 // ),
//                 // * Phone Number
//                 const SBH(h: 20),
//                 FieldPhoneNumber(
//                     valuePhone: PageRegisterState.userAuth.setPhoneNumber),
//                 // * Country
//                 const SBH(h: 20),
//                 FieldCountry(
//                     valueCountry: PageRegisterState.userAuth.setCountry),
//                 // * City
//                 const SBH(h: 20),
//                 FieldCity(valueCity: PageRegisterState.userAuth.setCity),
//                 const SBH(h: 20),
//                 // * Button

// Center(
//   child: _auth.isLoading
//       ? const AppLoading(chooseLoading: ChooseLoading.button)
//       : SimpleBtn(
//           btnTitle: KeyLang.uploadCv,
//           onTap: () async {
//             if (_keyForm.currentState?.validate() ?? false) {
//               _keyForm.currentState?.save();
//               FocusScope.of(context).requestFocus(FocusNode());
//               User? _user =
//                   await _auth.register(data: _userAuth);
//               if (_user != null) {
//                 _navHome(context);
//               } else {
//                 errorToast(_auth.errorMessage);
//               }
//             }
//           },
//         ),
// ),
//                 const SBH(h: 20),
//                 Center(
//                   child: _auth.isLoading
//                       ? const AppLoading(chooseLoading: ChooseLoading.button)
//                       : SimpleBtn(
//                           btnTitle: KeyLang.register,
//                           onTap: () async {
//                             if (_keyForm.currentState?.validate() ?? false) {
//                               _keyForm.currentState?.save();

//                               FocusScope.of(context).requestFocus(FocusNode());

//                               User? _result = await _auth.register(
//                                   data: PageRegisterState.userAuth);
//                               if (_result != null) {
//                                 Navigator.pop(context);
//                               } else {
//                                 errorToast(_auth.errorMessage);
//                               }
//                             }
//                           },
//                         ),
//                 ),

//                 const SBH(h: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

//   }

//   // * Navigator Home Page
//   void _navHome(BuildContext context) =>
//       Navigator.pushNamed(context, UserLandScape.id);
// }

// Center(
//   child: _auth.isLoading
//       ? const AppLoading(chooseLoading: ChooseLoading.button)
//       : SimpleBtn(
//           btnTitle: KeyLang.uploadCv,
//           onTap: () async {
//             if (_keyForm.currentState?.validate() ?? false) {
//               _keyForm.currentState?.save();
//               FocusScope.of(context).requestFocus(FocusNode());
//               User? _user =
//                   await _auth.register(data: _userAuth);
//               if (_user != null) {
//                 _navHome(context);
//               } else {
//                 errorToast(_auth.errorMessage);
//               }
//             }
//           },
//         ),
// ),
