import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

double regularSpacer = 25;
String isPublic = "Public";
String isPrivate = "Private";

class UserProfile extends StatefulWidget {
  // Add a parameter to the constructor

  const UserProfile({Key? key}) : super(key: key);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String cardStatus = isPrivate;
  String? _username; // Store the username in a private variable

  @override
  void initState() {
    super.initState();
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
                  // Handle option 3
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'option1',
                  child: Text('Create a collection'),
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
          /* Row(
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
                        await UserRepository.instance.displayPublicCard();
                        setState(() {
                          cardStatus = isPublic;
                        });
                      } catch (error) {
                        // Handle error
                      }
                    } else if (cardStatus == isPublic) {
                      try {
                        await UserRepository.instance.hidePublicCard(entryId);
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
          )*/
          Spacer(),
        ],
      ),
    );
  }
}
