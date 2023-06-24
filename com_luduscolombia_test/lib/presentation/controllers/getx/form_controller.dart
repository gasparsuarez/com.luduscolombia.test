import 'package:com_luduscolombia_test/domain/validator/validator.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  bool get isValidForm =>
      (Validator.isValidEmail(email.value) && Validator.isValidPassword(password.value))
          ? true
          : false;
}
