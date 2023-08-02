import 'package:conejoz/src/constants/ENG/text_strings_eng.dart';
import 'package:conejoz/src/features/authentication/screens/forget_password/forget_password_model_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          ForgetPasswordScreen.buildShowModalBottomSheet(context);
        },
        child: const Text(eForgetPasswordTitle),
      ),
    );
  }
}
