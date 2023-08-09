import 'package:conejoz/firebase_options.dart';
import 'package:conejoz/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart'; // Import UserRepository
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/features/theme/theme.dart';
import 'package:flutter/material.dart';

// Initialize both Firebase and UserRepository
Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthenticationRepository());
  Get.put(UserRepository()); // Initialize UserRepository
}

void main() async {
  // Initialize dependencies before running the app
  await initializeDependencies();

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
