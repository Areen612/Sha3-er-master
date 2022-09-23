import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:shagher/packages/pages/auth/manage_state/user_service.dart';
import 'package:shagher/packages/pages/auth/model/user_auth.dart';
import 'package:shagher/packages/pages/home/views/body.dart';
import 'package:shagher/service/theme/app_theme.dart';
import '../../../../language/generated/key_lang.dart';
import '../../../components/loading/app_loading.dart';
import '../../../components/loading/enum_loading.dart';
import '../../../components/space/size_box_height.dart';
import '../../../components/toast/custom_toast.dart';
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

    _handleSubmitAction() async {
      if (_keyForm.currentState?.validate() ?? false) {
        _keyForm.currentState?.save();

        FocusScope.of(context).requestFocus(FocusNode());

        User? _user = await _auth.register(data: _userAuth!);
        if (_user != null) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(_userAuth!.id)
              .set(_userAuth!.toMap()!);
          _navHome(context);
        } else {
          errorToast(_auth.errorMessage);
        }
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
                FieldPhoneNumber(valuePhone: _userAuth!.setPhoneNumber),
                // * Country
                const SBH(h: 20),
                FieldCountry(valueCountry: _userAuth!.setCountry),
                // * City
                const SBH(h: 20),
                FieldCity(valueCity: _userAuth!.setCity),
                const SBH(h: 20),
                // * Button
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
      Navigator.pushNamed(context, UserLandScape.id);
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