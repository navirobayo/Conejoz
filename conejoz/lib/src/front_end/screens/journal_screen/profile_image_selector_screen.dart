import 'package:conejoz/src/front_end/screens/app_dashboard_screen/app_dashboard_screen.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart';

class ProfileImageSelector extends StatefulWidget {
  const ProfileImageSelector({Key? key}) : super(key: key);

  @override
  State<ProfileImageSelector> createState() => _ProfileImageSelectorState();
}

class _ProfileImageSelectorState extends State<ProfileImageSelector> {
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

  Future<void> addPrivatePicture(String imageUrl) async {
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      await UserRepository.instance.addPictureToProfile(userId, imageUrl);
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
          "Profile image",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
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
                      addPrivatePicture(userImageUrls[index])
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
                child: const Text('Select this picture'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
