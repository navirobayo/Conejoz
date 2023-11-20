import 'package:conejoz/src/back_end/repositories/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// * Used in "Image Creator".

class ImageCreatorController extends GetxController {
  static ImageCreatorController get instance => Get.find();

  final RxBool _isLoading = false.obs;
  String? _imageUrl;
  File? _imageFile;

  String? get imageUrl => _imageUrl;
  File? get imageFile => _imageFile;
  bool get isLoading => _isLoading.value;

  Future<void> createImage(String text) async {
    final apiUrl = 'https://pyconejoz.onrender.com/process_text';

    _isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'text': text},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final imageUrl = data['image_url'];

        if (imageUrl != null) {
          // Store the image file temporarily
          final imageFile = await getImageFileFromUrl(imageUrl);
          _imageUrl = imageUrl;
          _imageFile = imageFile;

          await saveData();
        }
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during API request: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<String?> uploadImageToFirebase(
      File imageFile, String imageName) async {
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('DREAM_PICTURES')
          .child(imageName);
      final uploadTask = ref.putFile(imageFile);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }

  Future<File> getImageFileFromUrl(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/dream_image_temp.jpg');
    await tempFile.writeAsBytes(response.bodyBytes);
    return tempFile;
  }

  Future<void> saveData() async {
    if (_imageUrl != null && _imageFile == null) {
      final imageFile = await getImageFileFromUrl(_imageUrl!);
      _imageFile = imageFile;
    }
    if (_imageFile != null) {
      final imageName =
          'dream_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final downloadUrl = await uploadImageToFirebase(_imageFile!, imageName);
      if (downloadUrl != null) {
        final user = AuthenticationRepository.instance.firebaseUser.value;
        if (user != null) {
          final userId = user.uid;
          await UserRepository.instance
              .addImageToUserGallery(userId, downloadUrl);
        }
      }
    }
  }
}
