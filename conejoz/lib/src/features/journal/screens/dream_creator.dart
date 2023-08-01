import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DreamCreator extends StatefulWidget {
  const DreamCreator({Key? key});

  @override
  _DreamCreatorState createState() => _DreamCreatorState();
}

class _DreamCreatorState extends State<DreamCreator> {
  final TextEditingController _textEditingController = TextEditingController();

  String? _imageUrl;
  File? _imageFile; // Add this variable to store the actual image file
  String? _imageName; // Add this variable to store the image name

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

// This functions handles the image creation. Do not modify.
  Future<void> createImage(String text) async {
    final apiUrl =
        'https://pyconejoz.onrender.com/process_text'; // Replace with your Flask API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'text': text},
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response to get the image URL
        final data = jsonDecode(response.body);
        setState(() {
          _imageUrl = data['image_url'];
          _imageFile =
              null; // Reset the image file when you get a new image URL
        });
      } else {
        // Handle error cases here
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions here
      print('Error during API request: $e');
    }
  }

  Future<String?> uploadImageToFirebase(
      File imageFile, String imageName) async {
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('YOUR_STORAGE_DIRECTORY')
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("New Note Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 16),
            Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: _imageUrl != null
                        ? DecorationImage(
                            image: _imageFile != null
                                ? FileImage(_imageFile!)
                                : NetworkImage(_imageUrl!)
                                    as ImageProvider<Object>,
                            fit: BoxFit.cover,
                          )
                        : null, // Show a placeholder image or empty if _imageUrl is null
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Write your entry here.',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                createImage(_textEditingController.text);
              },
              child: const Text('Create image'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_imageUrl != null && _imageFile == null) {
                  final imageFile = await getImageFileFromUrl(
                      _imageUrl!); // Function to convert the URL to File
                  setState(() {
                    _imageFile = imageFile;
                  });
                }
                if (_imageFile != null) {
                  final imageName =
                      'dream_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
                  final downloadUrl =
                      await uploadImageToFirebase(_imageFile!, imageName);
                  if (downloadUrl != null) {
                    // TODO: Save the image downloadUrl to Firestore.
                    // Use Firebase Firestore to save the downloadUrl to the user's journal document.
                    // You can use Firebase's official Firestore plugin to achieve this.
                  }
                }
              },
              child: const Text('Save dream'),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}