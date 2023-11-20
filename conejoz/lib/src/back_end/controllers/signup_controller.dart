import 'package:conejoz/src/back_end/repositories/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart';
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
      "profileimage":
          "https://firebasestorage.googleapis.com/v0/b/conejoz-0000.appspot.com/o/DREAM_PICTURES%2FNo%20attachments.png?alt=media&token=94eef887-5b6a-4a24-ab37-2ac1797f1560",
      "bio": "No bio.",
      "contactinfo": "No contact information.",
      "location": "Unknown.",
      "entries": [],
      "userimages": [],
      "apptheme": "default"
    };
    userRepo.createRabbit(
        // This function is located in the UserRepository.
        rabbitDocument);
  }
}
