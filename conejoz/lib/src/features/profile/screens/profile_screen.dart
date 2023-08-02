import 'package:flutter/material.dart';

double regularSpacer = 25;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text('Taskforce909',
                  style: Theme.of(context).textTheme.labelLarge),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
