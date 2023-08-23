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
  final _userRepo = UserRepository.instance;
  int _radioValue = 1;
  final TextEditingController _tagsController = TextEditingController();

  String? lastUserImage;
  String? lastEntryTitle;
  String? lastEntryText;

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
                  image: lastUserImage != null
                      ? DecorationImage(
                          image: NetworkImage(lastUserImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              Text(lastEntryTitle ?? "Users Dream title from the database"),
              SizedBox(
                width: regularSpacer,
              ),
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
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Center(
                        child: Text(lastEntryText ??
                            "User dream text from the database"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: regularSpacer),
                // A text input to add tags to the dream
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _tagsController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tags',
                    ),
                  ),
                ),
                SizedBox(height: regularSpacer),
                // Two radio buttons to select the dream's visibility
                ListTile(
                  title: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value as int;
                          });
                        },
                      ),
                      const Text('Public'),
                      Radio(
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: (value) {
                          setState(() {
                            _radioValue = value as int;
                          });
                        },
                      ),
                      const Text('Private'),
                    ],
                  ),
                ),
                // A button to save the dream
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
