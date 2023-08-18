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
        title: Text(
          "Cloud Journal",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Spacer(),
                Text(
                  "Journal Manager",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 15),
                ),
                Spacer(),
                Card(
                  color: Theme.of(context).colorScheme.secondary,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JournalManager(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Icon(
                              color: Theme.of(context).colorScheme.onPrimary,
                              Icons.book)),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                Text(
                  "New Entry",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 15),
                ),
                Spacer(),
                Card(
                  color: Theme.of(context).colorScheme.secondary,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DreamBoard(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Icon(
                              color: Theme.of(context).colorScheme.onPrimary,
                              Icons.memory_sharp)),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                Text(
                  "Images Gallery",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                      fontSize: 15),
                ),
                Spacer(),
                Card(
                  color: Theme.of(context).colorScheme.secondary,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserGallery(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Icon(
                              color: Theme.of(context).colorScheme.onPrimary,
                              Icons.image_search_rounded)),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
