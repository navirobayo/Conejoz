import 'package:conejoz/src/constants/ENG/text_strings_eng.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(eDefaultSize),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            eForgetPasswordTitle,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(eForgotPassword),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Row(
              children: [
                const Icon(Icons.email_outlined, size: 60),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: eEmail,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
