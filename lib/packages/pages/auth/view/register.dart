import 'package:get/route_manager.dart';
import 'package:shagher/packages/components/button/simple_btn.dart';
import 'package:shagher/packages/pages/auth/components/company_reg.dart';
import 'package:shagher/packages/pages/auth/components/field_fname.dart';
import 'package:shagher/packages/pages/auth/components/field_lname.dart';
import 'package:shagher/packages/pages/auth/components/toggle_switch.dart';
import 'package:shagher/packages/pages/auth/manage_state/user_service.dart';
import 'package:shagher/packages/pages/auth/view/cv.dart';
import 'package:shagher/packages/pages/home/views/body.dart';
import 'package:shagher/service/validotors/app_validators.dart';

import '../../../components/loading/app_loading.dart';
import '../../../components/loading/enum_loading.dart';
//import '../manage_state/auth_service.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../../../language/generated/key_lang.dart';
import '../../../components/space/size_box_height.dart';
import '../components/field_email.dart';
import '../components/field_pass.dart';
import '../components/header_auth.dart';
import '../components/rich_text_auth.dart';
import '../model/user_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterWidget extends StatefulWidget {
  static const String id = 'RegisterWidget';
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => PageRegisterState();
}

class PageRegisterState extends State<RegisterWidget> {
  static String? pass;
  static int? flag = 0;
  static final ModelUserAuth _userAuth = ModelUserAuth();

  @override
  Widget build(BuildContext context) {
    // * Auth Provider
    final UserAuthService _auth = Provider.of<UserAuthService>(context);
    final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
    int _selectedIndex = 0;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              // * Header Auth
              const HeaderAuth(),
              ToggleSwitchCompany(onSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                  // flag = index;
                });
              }),

              Visibility(
                // replacement: const RegCompanyColumn(),
                child: Column(
                  children: [
                    const SBH(),

                    // * First name
                    FieldFname(valueFname: _userAuth.setFname),
                    const SBH(),
                    // * Last name
                    FieldLname(valueLname: _userAuth.setLname),
                    const SBH(),
                    // * Email
                    FieldEmail(valueEmail: _userAuth.setEmail),
                    const SBH(),
                    // * Password
                    // TODO: tr()
                    FieldPass(
                      onChanged: (value) => pass = value,
                      helperText: KeyLang.errorPass,
                    ),
                    const SBH(),
                    // * Confirm Password
                    FieldPass(
                      onValidators: (value) =>
                          AppValidators.isEqualPass(value, pass ?? ''),
                      valuePass: _userAuth.setPass,
                    ),
                    const SBH(h: 20),
                    // index stack
                    IndexedStack(
                      index: _selectedIndex,
                      children: [
                        const RegisterWidget(),
                        const RegCompanyColumn(),
                        CvForm(userAuth: _userAuth),
                      ],
                    ),
                    // * button
                    Center(
                      child: _auth.isLoading
                          ? const AppLoading(
                              chooseLoading: ChooseLoading.button)
                          : SimpleBtn(
                              btnTitle: KeyLang.cont,
                              onTap: () {
                                Get.to(CvForm(userAuth: _userAuth));
                                _selectedIndex = 2;
                                if (_keyForm.currentState?.validate() ??
                                    false) {
                                  _keyForm.currentState?.save();
                                  Get.to(CvForm(userAuth: _userAuth));
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             CvForm(userAuth: userAuth)));

                                  //Navigator.pushNamed(context, CvForm.id);
                                }
                              }
                              // onTap: () async {
                              //   if (_keyForm.currentState?.validate() ??
                              //       false) {
                              //     _keyForm.currentState?.save();
                              //     FocusScope.of(context)
                              //         .requestFocus(FocusNode());

                              //     User? _user =
                              //         await _auth.register(data: _userAuth);
                              //     if (_user != null) {
                              //       _navHome(context);
                              //     } else {
                              //       errorToast(_auth.errorMessage);
                              //     }
                              //   }
                              // },
                              ),
                    ),
                    const SBH(h: 20),
                    // *  have Account
                    RichTextAuth(
                      fword: KeyLang.haveAccount,
                      sword: KeyLang.login,
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
                //visible: flag == 0 ? true : false,
                //_replace(flag),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // * Navigator Home Page
  void _navHome(BuildContext context) =>
      Navigator.pushNamed(context, UserLandScape.id);

  // bool _replace(String? flag) {
  //   flag == 'Company' ? rep = true : rep = false;
  //   print('$flag  ${RegisterWidget.rep}');
  //   return RegisterWidget.rep;
  // }
}


// class RegisterWidget extends StatefulWidget {
//   static const String id = 'RegisterWidget';
//   // * key Form
//   // *  model save data
//   static final ModelUserAuth _userAuth = ModelUserAuth();
//   // * save pass

//   static bool rep = false;
//   const RegisterWidget({Key? key}) : super(key: key);

//   @override
//   State<RegisterWidget> createState() => PageRegisterState();
// }

// class PageRegisterState extends State<RegisterWidget> {
//   static String? pass;
//   static int? flag = 0;
//   static ModelUserAuth userAuth = ModelUserAuth();

//   @override
//   Widget build(BuildContext context) {
//     // * Auth Provider
//     // final AuthService _auth = Provider.of<AuthService>(context);
//     // * Auth Provider
//     final UserAuthService _auth = Provider.of<UserAuthService>(context);
//     final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Form(
//           key: _keyForm,
//           child: Column(
//             children: [
//               // * Header Auth
//               const HeaderAuth(),

//               ToggleSwitchCompany(onSelected: (index) {
//                 setState(() {
//                   flag = index;
//                 });
//               }),

//               Visibility(
//                 replacement: const RegCompanyColumn(),
//                 child: Column(
//                   children: [
//                     const SBH(),

//                     // * First name
//                     FieldFname(valueFname: PageRegisterState.userAuth.setFname),
//                     const SBH(),
//                     // * Last name
//                     FieldLname(valueLname: PageRegisterState.userAuth.setLname),
//                     const SBH(),
//                     // * Email
//                     FieldEmail(valueEmail: PageRegisterState.userAuth.setEmail),
//                     const SBH(),
//                     // * Password
//                     // TODO: tr()
//                     FieldPass(
//                       onChanged: (value) => pass = value,
//                       helperText: KeyLang.errorPass,
//                     ),
//                     const SBH(),
//                     // * Confirm Password
//                     FieldPass(
//                       onValidators: (value) =>
//                           AppValidators.isEqualPass(value, pass ?? ''),
//                       valuePass: PageRegisterState.userAuth.setPass,
//                     ),
//                     const SBH(h: 20),
//                     // * button
//                     Center(
//                       child: _auth.isLoading
//                           ? const AppLoading(
//                               chooseLoading: ChooseLoading.button)
//                           : SimpleBtn(
//                               btnTitle: KeyLang.cont,
//                               onTap: () {
//                                 // if (_keyForm.currentState?.validate() ??
//                                 //     false) {
//                                 //   _keyForm.currentState?.save();
//                                 Navigator.pushNamed(context, CvForm.id);
//                                 // }
//                               },
//                               // onTap: () async {
//                               //   if (_keyForm.currentState?.validate() ??
//                               //       false) {
//                               //     _keyForm.currentState?.save();
//                               //     FocusScope.of(context)
//                               //         .requestFocus(FocusNode());

//                               //     User? _user =
//                               //         await _auth.register(data: _userAuth);
//                               //     if (_user != null) {
//                               //       _navHome(context);
//                               //     } else {
//                               //       errorToast(_auth.errorMessage);
//                               //     }
//                               //   }
//                               // },
//                             ),
//                     ),
//                     const SBH(h: 20),
//                     // *  have Account
//                     RichTextAuth(
//                       fword: KeyLang.haveAccount,
//                       sword: KeyLang.login,
//                       onTap: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//                 visible: flag == 0 ? true : false,
//                 //_replace(flag),
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }

//   // * Navigator Home Page
//   void _navHome(BuildContext context) =>
//       Navigator.pushNamed(context, UserLandScape.id);

//   // bool _replace(String? flag) {
//   //   flag == 'Company' ? rep = true : rep = false;
//   //   print('$flag  ${RegisterWidget.rep}');
//   //   return RegisterWidget.rep;
//   // }
// }














