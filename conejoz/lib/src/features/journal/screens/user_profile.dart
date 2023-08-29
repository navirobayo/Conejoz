import 'package:conejoz/src/features/feed/screens/rabbit_card.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

double regularSpacer = 25;
String isPublic = "Public";
String isPrivate = "Private";

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _userRepo = UserRepository.instance;
  String cardStatus = isPrivate;
  String? _username;
  String? _profilePicture;
  List<String> _collections = [];
  String? _bio;
  String? _contactInfo;

  final _newUsernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUsername();

    // *
    /*
    // Initialize the user data from the repository
    final userRepo = UserRepository.instance;
    final user = userRepo.getCard();
    _username = user.username;
    _profilePicture = user.profilePicture;
    _collections = user.collections;
    _bio = user.bio;
    _contactInfo = user.contactInfo;
    */
    // *
  }

  Future<void> updateRabbitName(String newRabbitName) async {
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user != null) {
      final userId = user.uid;
      await UserRepository.instance.updateRabbitName(newRabbitName);
    }
  }

  void _getUsername() async {
    final username = await _userRepo.getRabbitNameByUserId();
    setState(() {
      _username = username ?? "";
    });
  }

  @override
  void dispose() {
    _newUsernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(UserRepository());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Profile.",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              switch (value) {
                case 'option1':
                  // Handle option 1
                  break;
                case 'option2':
                  // Handle option 2
                  break;
                case 'option3':
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Change username'),
                        content: TextField(
                          controller: _newUsernameController,
                          decoration: InputDecoration(
                            hintText: 'Enter new username',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final newUsername = _newUsernameController.text;
                              await updateRabbitName(newUsername);
                              setState(() {
                                _username = newUsername;
                              });
                              Navigator.pop(context);
                            },
                            child: Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Text('Create / delete a collection'),
                ),
                PopupMenuItem<String>(
                  value: 'option2',
                  child: Text('Change profile picture'),
                ),
                PopupMenuItem<String>(
                  value: 'option3',
                  child: Text('Change username'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: regularSpacer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/conejoz-0000.appspot.com/o/DREAM_PICTURES%2FNo%20attachments.png?alt=media&token=94eef887-5b6a-4a24-ab37-2ac1797f1560'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Access username from _username variable
              Text(_username ?? "Loading..."),
              SizedBox(
                width: regularSpacer,
              )
            ],
          ),
          SizedBox(height: regularSpacer),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                SizedBox(height: regularSpacer),
                Card(
                  color: Theme.of(context).colorScheme.secondary,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    onTap: () {
                      // Open collection
                    },
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Nightmares",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: regularSpacer),
                Card(
                  color: Theme.of(context).colorScheme.secondary,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    onTap: () {
                      // Open collection
                    },
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Psychedelics",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: regularSpacer),
              ],
            ),
          ),
          Row(
            children: [
              Spacer(),
              Row(
                children: [
                  Text("Public card status: "),
                  Text(cardStatus),
                ],
              ),
              Spacer(),
              Card(
                color: Theme.of(context).colorScheme.secondary,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
                  onTap: () async {
                    if (cardStatus == isPrivate) {
                      try {
                        // *
                        /*
                        await UserRepository.instance
                            .displayPublicCard(userData); */
                        // *
                        setState(() {
                          cardStatus = isPublic;
                        });
                      } catch (error) {
                        // Handle error
                      }
                    } else if (cardStatus == isPublic) {
                      try {
                        // *
                        /*

                        await UserRepository.instance
                            .deletePublicCard(userData); */
                        // *
                        setState(() {
                          cardStatus = isPrivate;
                        });
                      } catch (error) {
                        // Handle error
                      }
                    }
                  },
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Icon(
                        cardStatus == isPublic
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
