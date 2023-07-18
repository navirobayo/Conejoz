import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.language_outlined),
              onPressed: () {
                // Navigate to the language settings screen.
              },
            ),
            title: const Text('Language'),
            subtitle: const Text('Change your app\'s language.'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.language_outlined),
              onPressed: () {
                // Navigate to the language settings screen.
              },
            ),
            title: const Text('Language'),
            subtitle: const Text('Change your app\'s language.'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
