import 'package:com_luduscolombia_test/domain/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  void submit(BuildContext context) {
    bool isValidEmail = Validator.isValidEmail(email.value);
    bool isValidPassword = Validator.isValidPassword(password.value);
    if (isValidEmail && isValidPassword) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Cargando datos...'),
              content: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            );
          });
    }
  }
}
