import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
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
        title: Row(
          children: [
            Text(
              "Aug 17 at 5:24:32 UTC-5",
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Text("Psychedelic conversation with God.",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          SizedBox(height: 10),
          Text(
            "Time travel, nature, multiverse",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          SizedBox(height: 10),
          Text("No attachments",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          Text(
              "I was in the middle of a forest, and I saw a rabbit, and I asked it, 'What is the meaning of life?', then, after a very peacful moment he said, in a very calmed voice: 'I don't know, but I know that you are not living it.'",
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
        ],
      ),
    );
  }
}
