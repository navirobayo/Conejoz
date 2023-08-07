import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Textfield Controllers to get data from TextFields.
  final rabbit = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final userRepo = Get.put(UserRepository());
// This needs to be implemented. Not working yet.
  Future<bool> checkUsernameAvailability(String username) async {
    try {
      final user = await userRepo.getUserDetailsByUsername(username);
      return user == null;
    } catch (error) {
      print("Error checking username availability: $error");
      return false;
    }
  }

  // Call this function from Desing and it will do the rest.
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password)
        .then((_) {
      createRabbitDocument();
    }).catchError((error) {
      print("error: $error");
    });
  }

  void createRabbitDocument() {
    final rabbitDocument = {
      "rabbitname": rabbit.text.trim(),
      "defaultjournal": {
        "title": "Default Journal",
        "description": "Created by default",
        "created": DateTime.now(),
        "updated": DateTime.now(),
        "entries": [],
        "image_url": "",
      }
    };

    userRepo.createRabbit(rabbit.text.trim(), rabbitDocument).then((_) {
      Get.snackbar(
        "Success",
        "You are a rabbit now",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
      // Optionally, you can navigate to the next screen here.
      // For example: Get.to(() => NextScreen());
    }).catchError((error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }
}
