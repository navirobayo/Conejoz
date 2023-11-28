import 'package:conejoz/src/front_end/global_components/app_strings/multi_lang_app_strings.dart';
import 'package:conejoz/src/front_end/global_components/offline_themes/default_app_theme.dart';
import 'package:conejoz/src/back_end/controllers/dream_image_creator_controller.dart';
import 'package:conejoz/src/private/firebase_options.dart';
import 'package:conejoz/src/front_end/screens/authentication_screen/welcome_screen.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart'; // Import UserRepository
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// * Welcome

// Thank you for passing by :sunglassesemoji: This is the version 2.0.0 of Conejoz.

// * Glossary:

// A 'rabbit' is how the user of the app is called in the code.

// * App dependencies:

// The app uses GetX as a state management solution.
// The app uses Firebase as the backend.

// * Backend:
// The back end manages a simple structure as follows.

// - rabbits
// - publicdreams

// Now let's describe each of these collections.

// ! rabbits:

// Responsible for storing all the users as documents.
// Each document is named with the user's unique ID.
// Basically each user has its own document, named with its unique id.

// ! publicdreams:

// Responsible for storing all the public dreams of the users.
// Each 'dream' in this collection will be displayed in the public feed.

// * Folder structure:

// ! src/features:

// This folder contains all the features of the app.
// You can think of a feature as a "screen" of the app.
// Each feature has its own folder that manages its own code.

// /features:
//  - authentication
//  - dashboard
//  - dream_creator
//  - feed
//  - journal
//  - profile
//  - settings
//  - theme

// ! src/repository:

// This folder contains files that handle global functionalities that the app requires.
// You can think of a repository as a collection of functions that serve the app's overall functionality.

// ! src/constants:

// This folder contains files that handle constants (For example. Strings, values, etc.) of the app.
// This file is important because will allow the app to be easily translated to other languages.

// * About:

// Conejoz. A dream journaling app.
// Binocu 2023.
// For dreamers, by dreamers.

// ! The app starts here.
// ! Ver. 1.1.1

// This function initializes the app's dependencies.
Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(
      AuthenticationRepository()); // This repository handles authentication functions.
  Get.put(
      UserRepository()); // This repository handles data fetching and writing for the user's folder. // This controller handles the image creation.
  Get.put(
      ImageCreatorController()); // This controller handles the image creation.
}

// The main function of the app.
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
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      themeMode: ThemeMode.light,
      theme: DefaultAppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
