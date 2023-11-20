import 'package:conejoz/src/front_end/global_components/custom_icons/custom_icons.dart';
import 'package:conejoz/src/front_end/global_components/app_strings/global_strings.dart';
import 'package:conejoz/src/front_end/screens/authentication_screen/email_registration_screen.dart';
import 'package:conejoz/src/front_end/screens/authentication_screen/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                Row(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Icon(
                      ConejozLogos.conejozBlackFill,
                      size: 50.0,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Conejoz',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "ver. $appVersion",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                const SizedBox(height: 100.0),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Welcome'.tr,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    const Spacer(),
                    DropdownButton<String>(
                      value: _selectedLanguage,
                      items: <String>['English', 'Español'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLanguage = newValue ?? 'English';
                          Get.updateLocale(Locale(
                              _selectedLanguage == 'English' ? 'en' : 'es'));
                        });
                      },
                    ),
                    const Spacer()
                  ],
                ),
                const SizedBox(height: 100.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Login'.tr,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text("-"),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Register'.tr,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
