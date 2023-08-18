import 'package:flutter/material.dart';

// ! Not implemented yet.

class AudioEntry extends StatefulWidget {
  const AudioEntry({super.key});

  @override
  State<AudioEntry> createState() => _AudioEntryState();
}

class _AudioEntryState extends State<AudioEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("New Note Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            SizedBox(height: 16),
            IconButton(onPressed: null, icon: Icon(Icons.mic)),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
