import 'package:flutter/material.dart';

double regularSpacer = 25;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Dreamerspace"),
      ),
      body: ListView(children: [
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
                      'https://avatars.githubusercontent.com/u/101908819?v=4'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('John Doe', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
        SizedBox(height: regularSpacer),
        const Text(
            "A quote about dreaming. The user can select it from a selection available for the users, or can create one."),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
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
            splashColor: Colors.blue.withAlpha(30),
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
      ]),
    );
  }
}