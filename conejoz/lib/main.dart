import 'package:conejoz/firebase_options.dart';
import 'package:conejoz/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart'; // Import UserRepository
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/features/theme/theme.dart';
import 'package:flutter/material.dart';

// * Welcome dev:

// Thank you for passing by. This is the version 0.0.1 of Conejoz.

// * Glossary:

// A "rabbit" is a user of the app.

// * App dependencies:

// The app uses GetX as a state management solution.
// The app uses Firebase as the backend.

// * Back end:
// The back end manages a simple structure as follows.

// - rabbits
// - publicdreams

// Now let's describe each of these collections.

// ! rabbits:

// Responsable for storing all the users as documents.
// Each document is named with the user's unique id.
// Basically each user has its own document, named with its unique id.
// Inside of it they can store multiple information.

// ! publicdreams:

// Responsable for storing all the public dreamObjects of the users.
// Each dreamObject in this folder will be displayed in the public feed.

// This function initializes the dependencies of the app.

// * Folder structure:

// ! src:
// This folder contains all the code of the app.

// ! src/features:

// This folder contains all the features of the app.
// You can think of a feature as a "screen" of the app.
// Each feature has its own folder that manages its own code.

// Features:
// - authentication
// - dashboard
// - dream_creator
// - feed
// - journal
// - profile
// - settings
// - theme

// ! src/repository:

// This folder contains files that handle data fetching and writing for the features of the app.

// * About:

// Conejoz. A dream journaling app.
// Created by Ivan Robayo. Published by BINOCU. 2023.
// From Latinamerica, with love. For dreamers, by dreamers.

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(
      AuthenticationRepository()); // This repository handles authentication functions.
  Get.put(
      UserRepository()); // This repository handles data fetching and writing for the user's folder.
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
