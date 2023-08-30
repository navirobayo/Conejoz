import 'package:conejoz/src/features/feed/screens/rabbit_card.dart';
import 'package:conejoz/src/features/journal/screens/profile_image_selector.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

double regularSpacer = 25;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _userRepo = UserRepository.instance;
  String? _username;
  String? _bio;
  String? _contactInfo;
  String? _location;
  String? _profileImage;

  final _newUsernameController = TextEditingController();
  final _newBioController = TextEditingController();
  final _newLocationController = TextEditingController();
  final _newContactInfoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getRabbitData();

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
      await UserRepository.instance.updateRabbitName(newRabbitName);
    }
  }

  void _getRabbitData() async {
    final rabbitData = await _userRepo.getRabbitDataByUserId();
    setState(() {
      _username = rabbitData?["rabbitname"];
      _bio = rabbitData?["bio"];
      _contactInfo = rabbitData?["contactinfo"];
      _location = rabbitData?["location"];
      _profileImage = rabbitData?["profileimage"];
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Bio'),
                        content: Column(
                          children: [
                            TextField(
                              controller: _newBioController,
                              decoration: InputDecoration(
                                hintText: '¿Quién es $_username?',
                              ),
                            ),
                            TextField(
                              controller: _newLocationController,
                              decoration: InputDecoration(
                                hintText: 'Real or virtual location is ok',
                              ),
                            ),
                            TextField(
                              controller: _newContactInfoController,
                              decoration: InputDecoration(
                                hintText: 'Where can people reach you?',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () /* async */ {
                              /*
                              final newBio = _newBioController.text;
                              await updateRabbitBio(newBio);
                              setState(() {
                                _bio = newBio;
                              });
                              Navigator.pop(context); */
                            },
                            child: Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                  break;
                case 'option2':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileImageSelector(),
                    ),
                  );
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
                  child: Text('Update information'),
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
                  image: DecorationImage(
                    image: NetworkImage(_profileImage ?? ""),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Bio:"),
              Text(_bio ?? "Loading..."),
            ],
          ),
          SizedBox(height: regularSpacer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Location:"),
              Text(_location ?? "Loading..."),
            ],
          ),
          SizedBox(height: regularSpacer),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Contact info:"),
              Text(_contactInfo ?? "Loading..."),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
