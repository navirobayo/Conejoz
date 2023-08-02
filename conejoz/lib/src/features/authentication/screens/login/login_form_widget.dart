import 'package:conejoz/src/constants/ENG/text_strings_eng.dart';
import 'package:conejoz/src/features/authentication/controllers/login_controller.dart';
import 'package:conejoz/src/features/authentication/screens/forget_password/forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: eEmail,
                hintText: eEmail,
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: ePassword,
                hintText: ePassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null, icon: Icon(Icons.remove_red_eye))),
          ),
          const SizedBox(
            height: 25,
          ),
          const ForgetPasswordWidget(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  LoginController.instance.loginUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                }
              },
              child: Text(eLogin.toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
