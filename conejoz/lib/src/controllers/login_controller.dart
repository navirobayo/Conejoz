import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //Textfield Controllers to get data from TextFields.
  final email = TextEditingController();
  final password = TextEditingController();

  // Call this function from Desing and it will do the rest.
  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
  }
}
