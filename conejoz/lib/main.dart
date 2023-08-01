import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conejoz/src/features/theme/theme_service.dart';
import 'package:conejoz/firebase_options.dart';
import 'package:conejoz/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:conejoz/src/features/theme/theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'Conejoz Prototype',
          theme: ConejozTheme.lightTheme,
          darkTheme: ConejozTheme.darkTheme,
          themeMode: themeService.isDarkMode ? ThemeMode.light : ThemeMode.dark,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}
