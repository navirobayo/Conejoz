import 'package:conejoz/src/features/dream_creator/screens/dream_board.dart';
import 'package:conejoz/src/features/journal/screens/journal_manager.dart';
import 'package:conejoz/src/features/journal/screens/user_gallery.dart';
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
              color: Theme.of(context).colorScheme.secondary,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Theme.of(context).cardColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JournalManager(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 300,
                  height: 150,
                  child: Center(child: Icon(Icons.book)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.secondary,
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
                  width: 300,
                  height: 150,
                  child: Center(child: Icon(Icons.memory_sharp)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.secondary,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Theme.of(context).cardColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserGallery(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 300,
                  height: 150,
                  child: Center(child: Icon(Icons.image_search_rounded)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
