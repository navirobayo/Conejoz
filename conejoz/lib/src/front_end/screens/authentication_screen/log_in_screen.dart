import 'package:conejoz/src/front_end/global_components/custom_icons/custom_icons.dart';
import 'package:conejoz/src/back_end/controllers/login_controller.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/exceptions/login_email_password_failure.dart';
import 'package:conejoz/src/front_end/screens/authentication_screen/CHECK_forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final loginFormKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
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
                      child: Text('Login ->'.tr),
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: loginController.password,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password'.tr,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter your password'.tr;
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
