import 'package:conejoz/firebase_options.dart';
import 'package:conejoz/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/features/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Conejoz Prototype',
      theme: ConejozTheme.lightTheme,
      darkTheme: ConejozTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const WelcomeScreen(),
    );
  }
}
