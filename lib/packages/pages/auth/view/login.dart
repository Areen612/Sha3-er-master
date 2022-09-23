import 'package:shagher/packages/components/button/simple_btn.dart';
import 'package:shagher/packages/pages/auth/manage_state/company_service.dart';
import 'package:shagher/packages/pages/auth/manage_state/user_service.dart';
import 'package:shagher/packages/pages/home/views/body.dart';
import '../../../components/loading/app_loading.dart';
import '../../../components/loading/enum_loading.dart';
import '../../../components/toast/custom_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../../../language/generated/key_lang.dart';
import '../../../components/space/size_box_height.dart';
import '../components/field_email.dart';
import '../components/field_pass.dart';
import '../components/forgot_pass_text.dart';
import '../components/header_auth.dart';
import '../components/rich_text_auth.dart';
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
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * Auth Provider
    final UserAuthService _auth = Provider.of<UserAuthService>(context);
    final CompanyAuthService _comp = Provider.of<CompanyAuthService>(context);
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
              FieldEmail(valueEmail: _userAuth.setEmail),
              const SBH(),
              // * Password
              FieldPass(valuePass: _userAuth.setPass),
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
                          if (_keyForm.currentState?.validate() ?? false) {
                            _keyForm.currentState?.save();
                            FocusScope.of(context).requestFocus(FocusNode());

                            User? _user = await _auth.login(data: _userAuth);
                            if (_user != null) {
                              _navHome(context);
                            } else {
                              errorToast(_auth.errorMessage);
                            }
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

  // * Navigator Home Page
  void _navHome(BuildContext context) =>
      Navigator.pushNamed(context, UserLandScape.id);
}
