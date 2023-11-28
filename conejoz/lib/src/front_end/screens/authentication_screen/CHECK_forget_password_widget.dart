import 'package:conejoz/src/front_end/global_components/text_strings.dart';
import 'package:conejoz/src/front_end/screens/authentication_screen/CHECK_forget_password_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
        child: Text("I forgot my password".tr),
      ),
    );
  }
}
