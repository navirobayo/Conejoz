import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

double regularSpacer = 25;

class DreamFileCreator extends StatefulWidget {
  const DreamFileCreator({Key? key}) : super(key: key);

  @override
  _DreamFileCreatorState createState() => _DreamFileCreatorState();
}

class _DreamFileCreatorState extends State<DreamFileCreator> {
  // Instance of UserRepository to access user data
  final _userRepo = UserRepository.instance;

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
        title: const Text("New Dream Entry"),
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
                        'https://avatars.githubusercontent.com/u/140388501?s=200&v=4'), //This is an example. The actual immage should be the last available picture in the userimages file via firebase. ,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text("Users Dream title from the database"),
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
                      child: Center(
                          child: Text("User dream text from the database")),
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
