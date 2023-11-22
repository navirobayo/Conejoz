import 'package:conejoz/src/back_end/repositories/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart'; // Import the user repository

class UserGallery extends StatefulWidget {
  const UserGallery({super.key});

  @override
  State<UserGallery> createState() => _UserGalleryState();
}

class _UserGalleryState extends State<UserGallery> {
  List<String> userImageUrls = []; // List to store image URLs

  @override
  void initState() {
    super.initState();
    loadUserImages(); // Load user images when the widget initializes
  }

  //! Separate logic if possible.

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
          "User Gallery",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        //* Activate the following line once the logic to delete the pictures is ready
        /* actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.more_vert))
        ], */
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: userImageUrls.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).colorScheme.onError,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Theme.of(context).cardColor,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: SizedBox(
                        child: Image.network(
                          userImageUrls[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                );
              },
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
