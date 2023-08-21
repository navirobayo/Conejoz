import 'package:conejoz/src/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/repository/models/rabbit_model.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

double regularSpacer = 25;

class ProfileScreen extends StatefulWidget {
  final String username; // Add a parameter to the constructor

  const ProfileScreen({Key? key, required this.username}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _username; // Store the username in a private variable

  @override
  void initState() {
    super.initState();
    _username = widget
        .username; // Initialize the private variable with the value from the constructor
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
                  color: Theme.of(context).colorScheme.secondary,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    onTap: () {
                      // Open dream
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
                      // Open dream
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
        ],
      ),
    );
  }
}
