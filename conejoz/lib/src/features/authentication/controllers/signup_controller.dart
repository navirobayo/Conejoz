import 'package:conejoz/src/features/authentication/models/rabbit_model.dart';
import 'package:conejoz/src/features/dashboard/screens/conejoz_dashboard.dart';
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

  // Call this function from Desing and it will do the rest.
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(RabbitModel user) async {
    await userRepo.createUser(user);
    Get.to(() => const ConejozDashboard());
  }
}
