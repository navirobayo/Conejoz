import 'package:conejoz/src/constants/text_strings_eng.dart';
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                const Text(
                  eLogin,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Cool text goes here",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const LoginFormWidget(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("OR"),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.account_balance_wallet_rounded),
                          label: const Text("SignInWithGoogle"),
                        ),
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text(eCreateAnAccount))
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
