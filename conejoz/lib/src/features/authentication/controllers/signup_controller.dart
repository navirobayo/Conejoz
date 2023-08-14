import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// * This file controls functions for the SignUp Screen.

class SignUpController extends GetxController {
  static SignUpController get instance =>
      Get.find(); // This allows to use the controller anywhere in the app.

  final rabbit = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final userRepo =
      Get.put(UserRepository()); // This is an instance of the UserRepository.

  void registerUser(String email, String password) {
    // This function registers the user and then triggers the creation of the RabbitDocument.
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password)
        .then((_) {
      createRabbitDocument();
    }).catchError((error) {
      print("error: $error");
    });
  }

  void createRabbitDocument() {
    // This function creates the RabbitDocument inside of the user's document.
    final rabbitDocument = {
      "defaultjournal": {
        "title": "A private journal",
        "description": "Created by default by the Conejoz app",
        "entries": [],
        "coverimage": "",
      },
      "usergallery": {
        "title": "Dream images",
        "userimages": [],
      },
      "rabbitname": rabbit.text.trim(),
    };
    userRepo.createRabbit(
        rabbitDocument); // This function is located in the UserRepository.
  }
}
