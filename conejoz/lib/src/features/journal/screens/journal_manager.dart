import 'package:conejoz/src/features/journal/screens/entry_screen.dart';
import 'package:flutter/material.dart';

class JournalManager extends StatefulWidget {
  const JournalManager({super.key});

  @override
  State<JournalManager> createState() => _JournalManagerState();
}

class _JournalManagerState extends State<JournalManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: IconButton(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Journal Manager",
              style: TextStyle(color: Theme.of(context).colorScheme.surface))),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Psychedelic conversation with God.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            subtitle: Text(
              'Time travel, nature, multiverse',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
            trailing: Text(
              'Aug 17 at 5:24:32 UTC-5',
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EntryScreen(),
                ),
              );
            },
          ),
          Divider(height: 0),
          ListTile(
            title: Text(
              'Psychedelic conversation with God.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            subtitle: Text(
              'Time travel, nature, multiverse',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
            trailing: Text(
              'Aug 17 at 5:24:32 UTC-5',
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
            onTap: () {
              // Open the entry.
            },
          ),
          Divider(height: 0),
          ListTile(
            title: Text(
              'Psychedelic conversation with God.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            subtitle: Text(
              'Time travel, nature, multiverse',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
            trailing: Text(
              'Aug 17 at 5:24:32 UTC-5',
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}
