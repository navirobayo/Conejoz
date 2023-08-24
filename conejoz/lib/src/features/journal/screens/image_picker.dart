import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

class ImagePicker extends StatefulWidget {
  final String entryId;

  const ImagePicker({Key? key, required this.entryId}) : super(key: key);

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  List<String> userImageUrls = [];

  @override
  void initState() {
    super.initState();
    loadUserImages();
  }

  Future<void> loadUserImages() async {
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      final userDocument =
          await UserRepository.instance.getUserDocument(userId);
      if (userDocument != null) {
        setState(() {
          userImageUrls =
              List<String>.from(userDocument['usergallery']['userimages']);
        });
      }
    }
  }

  Future<void> addAttachment(String imageUrl) async {
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      await UserRepository.instance
          .addPictureToEntry(userId, widget.entryId, imageUrl);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: userImageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return _ImageDialog(
                    imageUrl: userImageUrls[index],
                    onAdd: () {
                      addAttachment(userImageUrls[index]);
                    },
                  );
                },
              );
            },
            child: Card(
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              color: Theme.of(context).colorScheme.onError,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                userImageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ImageDialog extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onAdd;

  const _ImageDialog({
    Key? key,
    required this.imageUrl,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(imageUrl),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: onAdd,
                child: const Text('Add this picture'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
