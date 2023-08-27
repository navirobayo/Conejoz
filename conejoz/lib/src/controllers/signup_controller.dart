import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// * This file controls functions for the SignUp Screen.

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  // This allows to use the controller anywhere in the app.

  final rabbit = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final UserRepository userRepo = Get.find();

  void registerUser(String email, String password) {
    // This function triggers registration and then triggers the creation of the RabbitDocument.
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email,
            password) // Note that this function is located in the AuthenticationRepository.
        .then((_) {
      createRabbitDocument();
    }).catchError((error) {
      print("error: $error");
    });
  }

  void createRabbitDocument() {
    // This function creates the RabbitDocument inside of the user's document.
    final rabbitDocument = {
      "rabbitname": rabbit.text.trim(),
      "profileimage": "adefaultimage",
      "entries": [], // *
      "userimages": [], // *
    };
    userRepo.createRabbit(
        // This function is located in the UserRepository.
        rabbitDocument);
  }
}
