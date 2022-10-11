import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shagher/packages/components/button/simple_btn.dart';
import 'package:shagher/packages/pages/auth/components/rich_text_auth.dart';
import 'package:shagher/packages/pages/auth/manage_state/user_service.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:shagher/packages/pages/company/views/landscape.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/loading/app_loading.dart';
import '../../../components/loading/enum_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../../../language/generated/key_lang.dart';
import '../../../components/space/size_box_height.dart';
import '../../home/views/body.dart';
import '../components/field_email.dart';
import '../components/field_pass.dart';
import '../components/forgot_pass_text.dart';
import '../components/header_auth.dart';
import '../model/user_auth.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWidget extends StatelessWidget {
  static const String id = 'LoginWidget';
  // * key Form
  static final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  // *  model save data
  static final ModelUserAuth _userAuth = ModelUserAuth();
  static final ModelCompanyAuth _companyAuth = ModelCompanyAuth();

  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    // * Auth Provider
    final UserAuthService _auth = Provider.of<UserAuthService>(context);
    // final RoleChange _roleProvider = Provider.of<RoleChange>(context);
    //final CompanyAuthService _comp = Provider.of<CompanyAuthService>(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              // * header Auth
              const HeaderAuth(),
              const SBH(h: 30),
              // * Email
              FieldEmail(controller: emailcontroller),
              const SBH(),
              // * Password
              FieldPass(controller: passwordcontroller),
              const SBH(),
              // * Forget Password
              const ForgotPassText(),
              const SBH(),

              // * button
              Center(
                child: _auth.isLoading
                    ? const AppLoading(chooseLoading: ChooseLoading.button)
                    : SimpleBtn(
                        btnTitle: KeyLang.login,
                        onTap: () async {
                          //checks if the user is within the database
                          if (_keyForm.currentState!.validate()) {
                            // User? user = FirebaseAuth.instance.currentUser;

                            // if (user != null && !user.emailVerified) {
                            //   await user.sendEmailVerification();
                            // }
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text)
                                .then(
                              (uid) async {
                                User? user = FirebaseAuth.instance.currentUser;
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString("userId", user!.uid);

                                Fluttertoast.showToast(msg: 'Login successful');

                                DocumentSnapshot value = await FirebaseFirestore
                                    .instance
                                    .collection('users')
                                    .doc(user.uid)
                                    .get();

                                Map<String, dynamic>? temp =
                                    value.data() as Map<String, dynamic>;
                                dynamic loginuser;
                                if (temp['role'] == 'user') {
                                  loginuser = ModelUserAuth.fromMap(temp);
                                  _navUser(context);
                                } else if (temp['role'] == 'company') {
                                  loginuser = ModelCompanyAuth.fromMap(temp);
                                  _navCompany(context);
                                }
                                print(' login user $loginuser');

                                // _navRole(context);
                              },
                            ).catchError(
                              (err) {
                                Fluttertoast.showToast(msg: err!.message);
                              },
                            );
                          }
                        },
                      ),
              ),

              const SBH(h: 20),
              // * Don't have Account
              RichTextAuth(
                fword: KeyLang.notAccount,
                sword: KeyLang.register,
                onTap: () => _navRegister(context),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  // * navigator Register
  void _navRegister(BuildContext context) =>
      Navigator.pushNamed(context, RegisterWidget.id);

  // void _navRole(BuildContext context) =>
  //     Navigator.pushNamed(context, ManageRole.id);

  void _navUser(BuildContext context) =>
      Navigator.pushReplacementNamed(context, UserLandScape.id);

// * Navigator Home Page
  void _navCompany(BuildContext context) =>
      Navigator.pushReplacementNamed(context, CompanyLandScape.id);

  // * Navigator Home Page
  // void _navHome(BuildContext context) =>
  //     Navigator.pushReplacementNamed(context, UserLandScape.id);

  // // * Navigator Home Page
  // void _navCompany(BuildContext context) =>
  //     Navigator.pushReplacementNamed(context, CompanyLandScape.id);
}
