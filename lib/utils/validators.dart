import 'package:email_validator/email_validator.dart';

class Validators {
  static String? validateEmail(String? value) {

    return  EmailValidator.validate(value??'') ? null : 'Please enter a valid email';
  }
}
