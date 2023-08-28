import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

class ImagesSelector extends StatefulWidget {
  final String entryId;

  const ImagesSelector({Key? key, required this.entryId}) : super(key: key);

  @override
  State<ImagesSelector> createState() => _ImagesSelectorState();
}

class _ImagesSelectorState extends State<ImagesSelector> {
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
          userImageUrls = List<String>.from(userDocument['userimages']);
        });
      }
    }
  }

  Future<void> addPrivateAttachment(String imageUrl) async {
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      await UserRepository.instance
          .addPictureToLog(userId, widget.entryId, imageUrl);
    }
  }

  Future<void> updatePublicAttachment(String imageUrl) async {
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      await UserRepository.instance
          .addPictureAndUpdatePublicCover(userId, widget.entryId, imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Adding image",
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
      ),
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
                      addPrivateAttachment(userImageUrls[index])
                          .then((_) =>
                              updatePublicAttachment(userImageUrls[index]))
                          .then((_) => Navigator.pop(context));
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
