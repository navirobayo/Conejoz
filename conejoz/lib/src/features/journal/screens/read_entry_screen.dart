import 'package:conejoz/src/constants/conejoz_logos.dart';
import 'package:flutter/material.dart';

class ReadEntryScreen extends StatefulWidget {
  const ReadEntryScreen({super.key});

  @override
  State<ReadEntryScreen> createState() => _ReadEntryScreenState();
}

class _ReadEntryScreenState extends State<ReadEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Text(
              "I was in the middle of a forest, and I saw a rabbit, and I asked it, 'What is the meaning of life?', then, after a very peacful moment he said, in a very calmed voice: 'I don't know, but I know that you are not living it.'",
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
        ],
      ),
    );
  }
}
