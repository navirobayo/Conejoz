import 'package:conejoz/src/constants/ENG/text_strings_eng.dart';
import 'package:conejoz/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100.0,
                ),
                Text(
                  eLogin,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Cool text goes here",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                LoginFormWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
