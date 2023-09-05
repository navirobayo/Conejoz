import 'package:conejoz/src/constants/conejoz_logos.dart';
import 'package:conejoz/src/controllers/signup_controller.dart';
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
                      child: const Text('Continue ->'),
                    ),
                  ],
                ),
                const SizedBox(height: 50.0),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: signUpController.rabbit,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your rabbitname';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: signUpController.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: signUpController.password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: signUpController.confirmPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
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
