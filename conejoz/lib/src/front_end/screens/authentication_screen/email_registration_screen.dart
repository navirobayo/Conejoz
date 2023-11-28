import 'package:conejoz/src/front_end/global_components/custom_icons/custom_icons.dart';
import 'package:conejoz/src/back_end/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(
        SignUpController()); // Dependency Injection of the SignUpController.
    final signUpFormKey =
        GlobalKey<FormState>(); // Form Key to validate the form.

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: signUpFormKey,
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                Row(
                  children: [
                    Icon(
                      ConejozLogos.conejozBlackFill,
                      size: 50.0,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        if (signUpFormKey.currentState!.validate()) {
                          //This register the user with email and password into Firebase.
                          SignUpController.instance.registerUser(
                            signUpController.email.text.trim(),
                            signUpController.password.text.trim(),
                          );
                        }
                      },
                      child: Text('Continue ->'.tr),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: signUpController.rabbit,
                  decoration: InputDecoration(
                    labelText: 'Username'.tr,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a username'.tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: signUpController.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email'.tr,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter an email'.tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: signUpController.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password'.tr,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your password'.tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: signUpController.confirmPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm password'.tr,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm your password'.tr;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
