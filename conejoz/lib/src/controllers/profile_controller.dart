import 'package:conejoz/src/repository/models/rabbit_model.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

// ! Not used. Delete if not used in the future.

/*class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  Rx<UserModel?> user = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getUserData(); // Fetch user data when the controller is initialized
  }

  void getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      _userRepo.getUserDetails(email).then((userData) {
        user.value = userData; // Notify listeners that user data is available
      }).catchError((error) {
        Get.snackbar("Error", "Failed to fetch user data");
      });
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}

  /*Future<List<RabbitModel>> getAllRabbits() async =>
      await _userRepo.allRabbits();

  updateRecord(RabbitModel user) async {
    await _userRepo.updateRabbitRecord(user);
  } */
*/
