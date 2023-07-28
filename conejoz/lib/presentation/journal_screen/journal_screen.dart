import 'package:flutter/material.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cloud Journal"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello dreamer',
            ),
            Text(
              'What are you dreaming today?',
            ),
            Text(
              'This is the main functionality. Here is where the user will create all of the content.',
            ),
          ],
        ),
      ),
    );
  }
}
