import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shagher/language/generated/key_lang.dart';
import 'package:shagher/packages/components/button/simple_btn.dart';
import 'package:shagher/packages/components/loading/app_loading.dart';
import 'package:shagher/packages/components/loading/enum_loading.dart';
import 'package:shagher/packages/components/space/size_box_height.dart';
import 'package:shagher/packages/components/text_field_form/custom_filed.dart';
import 'package:shagher/packages/components/toast/custom_toast.dart';
import 'package:shagher/packages/pages/auth/components/field_city.dart';
import 'package:shagher/packages/pages/auth/components/field_company_name.dart';
import 'package:shagher/packages/pages/auth/components/field_country.dart';
import 'package:shagher/packages/pages/auth/components/field_specialty.dart';
import 'package:shagher/packages/pages/auth/components/field_email.dart';
import 'package:shagher/packages/pages/auth/components/field_pass.dart';
import 'package:shagher/packages/pages/auth/manage_state/company_service.dart';
import 'package:shagher/packages/pages/auth/model/company_auth.dart';
import 'package:shagher/packages/pages/home/views/body.dart';
import 'package:shagher/service/validotors/app_validators.dart';
import 'package:shagher/util/path_icons.dart';
import 'rich_text_auth.dart';

class RegCompanyColumn extends StatelessWidget {
  const RegCompanyColumn({Key? key}) : super(key: key);
  static final ModelCompanyAuth _companyAuth = ModelCompanyAuth();
  static final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  // * save pass
  static String? pass;
  static String? flag;

  @override
  Widget build(BuildContext context) {
    // * Auth Provider
    final CompanyAuthService _auth = Provider.of<CompanyAuthService>(context);

    _handleSubmitAction() async {
      if (_keyForm.currentState?.validate() ?? false) {
        _keyForm.currentState?.save();
        FocusScope.of(context).requestFocus(FocusNode());
        User? _user = await _auth.registerCompany(data: _companyAuth);
        if (_user != null) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(_companyAuth.id)
              .set(_companyAuth.toMap());
          _navHome(context);
        } else {
          errorToast(_auth.errorMessage);
        }
      }
    }

    return Column(
      children: [
        const SBH(),
        // * Company name
        FieldCompanyName(valueCompanyName: _companyAuth.setCompanyName),
        const SBH(),
        // * Email
        FieldEmail(valueEmail: _companyAuth.setEmail),
        const SBH(),
        // * Password
        FieldPass(
          onChanged: (value) => pass = value,
          helperText: KeyLang.errorPass,
        ),
        const SBH(),
        // * Confirm Password
        FieldPass(
          onValidators: (value) => AppValidators.isEqualPass(value, pass ?? ''),
          valuePass: _companyAuth.setPassword,
        ),
        const SBH(),
        // * Specialty
        FieldSpecialty(valueSpecialty: _companyAuth.setSpecialty),
        const SBH(),
        // * Country
        FieldCountry(valueCountry: _companyAuth.setCountry),
        const SBH(),
        // * City
        FieldCity(valueCity: _companyAuth.setCity),
        const SBH(),
        // * Enterprise Owner
        CustomField(
            labelText: KeyLang.enterpriseOwner, pIcon: PathIcons.company),
        const SBH(),
        // * Commercial Address
        CustomField(
            labelText: KeyLang.commercialAddress, pIcon: PathIcons.company),
        const SBH(),
        // * Status
        CustomField(labelText: KeyLang.status, pIcon: PathIcons.company),
        const SBH(),
        // * National Invester Number
        CustomField(
            labelText: KeyLang.nationalInvestorNumber,
            pIcon: PathIcons.company),
        const SBH(),
        // * Commercial Number
        CustomField(
            labelText: KeyLang.commercialNumber, pIcon: PathIcons.company),
        const SBH(),
        // * Commercial Name
        CustomField(
            labelText: KeyLang.commercialName, pIcon: PathIcons.company),
        const SBH(h: 20),
        // * button
        Center(
          child: _auth.isLoading
              ? const AppLoading(chooseLoading: ChooseLoading.button)
              : SimpleBtn(
                  btnTitle: KeyLang.register, onTap: _handleSubmitAction),
        ),
        const SBH(h: 20),
        // *  have Account
        RichTextAuth(
          fword: KeyLang.haveAccount,
          sword: KeyLang.login,
          onTap: () => Navigator.pop(context),
        ),
        const SBH(h: 20),
      ],
    );
  }
}

// * Navigator Home Page
void _navHome(BuildContext context) =>
    Navigator.pushNamed(context, UserLandScape.id);
