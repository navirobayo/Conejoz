import 'package:conejoz/src/features/dream_creator/screens/dream_board.dart';
import 'package:conejoz/src/features/dream_creator/screens/dream_image_creator.dart';
import 'package:conejoz/src/features/dream_creator/screens/dream_text_entry.dart';
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
                      builder: (context) => const ImageCreator(),
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
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Theme.of(context).cardColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextEntry(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Icon(Icons.book)),
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Theme.of(context).cardColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DreamBoard(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Icon(Icons.casino)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
