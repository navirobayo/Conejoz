import 'package:conejoz/presentation/journal_screen/dream_creator.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Theme.of(context).cardColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DreamCreator(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Icon(Icons.memory_sharp)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
