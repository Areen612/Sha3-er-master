import '../../language/generated/key_lang.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:validators/validators.dart' as validators;

class AppValidators {
  // * message
  static final _messageEnterValue = KeyLang.enterValue.tr();
  static final _messageCorrectEmail = KeyLang.errorEmail.tr();
  static final _messageCorrectPass = KeyLang.errorPass.tr();
  static final _messageCorrectCPass = KeyLang.errorConfirmPass.tr();
  static final _messageCorrectNum = KeyLang.errorPhoneNumber.tr();

  // * Not empty
  static String? isEmpty(String? value) {
    final String? valueTrim = value?.trim();
    if (valueTrim?.isEmpty ?? true) {
      return _messageEnterValue;
    }
  }

  // * Email
  static String? isEmail(String? value) {
    final String? valueTrim = value?.trim();
    if (valueTrim?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isEmail(valueTrim!)) {
      return _messageCorrectEmail;
    }
  }

  static String? isPass(String? value) {
    final String? valueTrim = value?.trim();
    if (valueTrim?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.matches(value!,
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')) {
      return _messageCorrectPass;
    }
  }

  // * equal Pass
  static String? isEqualPass(String? value, String pass) {
    final String? valueTrim = value?.trim();
    if (valueTrim?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.equals(valueTrim, pass.trim())) {
      return _messageCorrectCPass;
    }
  }

  static String? isNum(String? value) {
    final String? valueTrim = value?.trim();
    if (valueTrim?.isEmpty ?? true) {
      return _messageEnterValue;
    } else if (!validators.isLength(valueTrim!, 9)) {
      return _messageCorrectNum;
    }
  }
}
