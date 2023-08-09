import 'package:conejoz/src/features/authentication/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/features/authentication/models/rabbit_model.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

double regularSpacer = 25;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Instance of UserRepository to access user data
  final _userRepo = UserRepository.instance;

  // The username retrieved from the repository
  String? _username;

  @override
  void initState() {
    super.initState();
    // Trigger the function to get the username once the screen is opened
    _getUsername();
  }

  // Function to retrieve the username from the UserRepository
  void _getUsername() async {
    final username = await _userRepo.getRabbitNameByUserId();
    setState(() {
      _username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(UserRepository());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Dreamerspace"),
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
                        'https://avatars.githubusercontent.com/u/140388501?s=200&v=4'),
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
            child: ListView(
              children: [
                SizedBox(height: regularSpacer),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Theme.of(context).cardColor,
                    onTap: () {
                      // Open dream
                    },
                    child: const SizedBox(
                      width: 150,
                      height: 150,
                      child: Center(child: Text("Journal 1")),
                    ),
                  ),
                ),
                SizedBox(height: regularSpacer),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Theme.of(context).cardColor,
                    onTap: () {
                      // Open dream
                    },
                    child: const SizedBox(
                      width: 150,
                      height: 150,
                      child: Center(child: Text("Journal 2")),
                    ),
                  ),
                ),
                SizedBox(height: regularSpacer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
