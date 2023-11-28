import 'package:conejoz/src/front_end/global_components/text_strings.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/exceptions/login_email_password_failure.dart';
import 'package:conejoz/src/front_end/screens/authentication_screen/CHECK_forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/authentication_repository.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              labelText: engEmail,
              hintText: engEmail,
              border: OutlineInputBorder(),
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
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: engPassword,
              hintText: engPassword,
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.remove_red_eye),
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await AuthenticationRepository.instance
                        .loginWithEmailAndPassword(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  } on LogInWithEmailAndPasswordFailure catch (e) {
                    // Handle login failure exception here.
                    // Show an error message to the user.
                    // For example: Show a snackbar or a dialog with the error message.
                    print("LOGIN ERROR: ${e.message}");
                  }
                }
              },
              child: Text(engLogin.toUpperCase()),
            ),
          )
        ],
      ),
    );
  }
}
