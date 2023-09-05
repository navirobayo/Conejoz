import 'package:conejoz/src/constants/conejoz_logos.dart';
import 'package:conejoz/src/controllers/login_controller.dart';
import 'package:conejoz/src/features/authentication/screens/forget_password/forget_password_widget.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/repository/authentication_repository/exceptions/login_email_password_failure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final loginFormKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                Row(
                  children: [
                    Icon(
                      ConejozLogos.conejozBlackFill,
                      size: 50.0,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () async {
                        if (loginFormKey.currentState!.validate()) {
                          try {
                            await AuthenticationRepository.instance
                                .loginWithEmailAndPassword(
                              loginController.email.text.trim(),
                              loginController.password.text.trim(),
                            );
                          } on LogInWithEmailAndPasswordFailure catch (e) {
                            // Handle login failure exception here.
                            // Show an error message to the user.
                            // For example: Show a snackbar or a dialog with the error message.
                            print("LOGIN ERROR: ${e.message}");
                          }
                        }
                      },
                      child: const Text('Login ->'),
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                  ],
                ),
                Form(
                  key: loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: loginController.email,
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: loginController.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const ForgetPasswordWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
