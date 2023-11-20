import 'package:conejoz/src/front_end/screens/app_dashboard_screen/app_dashboard_screen.dart';
import 'package:conejoz/src/front_end/screens/authentication_screen/welcome_screen.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/exceptions/login_email_password_failure.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// * This file controls authentication features.

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get
      .find(); // This allows to access the class instance from anywhere in the app.

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser; // Reactive variable.
  // This allows to listen to changes in the variable.

  @override
  void onReady() {
    // This method is called immediately after the widget is allocated memory.
    // This is important because it allows to initialize the reactive variable.
    // So every time that the user changes, the app will be redirected to the
    // correct screen.
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    // This method is called every time the firebaseUser variable changes.
    // It redirects the user to the correct screen.
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const ConejozDashboard());
  }

  Future<void> createUserWithEmailAndPassword(
      // This method creates a new user with email and password.
      String email,
      String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("EXCEPTION - ${ex.message}");
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    // This method logs in a user with email and password.
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      rethrow; // Rethrow the exception to handle it in the UI.
    } catch (e) {
      final ex = LogInWithEmailAndPasswordFailure();
      print("EXCEPTION - ${ex.message}");
      rethrow; // Rethrow the exception to handle it in the UI.
    }
  }

  Future<void> logout() async => await _auth.signOut();
  // This method logs out the current user.
}
