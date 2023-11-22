import 'package:conejoz/src/front_end/screens/settings_screen/about_screen.dart';
import 'package:conejoz/src/front_end/screens/settings_screen/manual_screen.dart';
import 'package:conejoz/src/front_end/screens/settings_screen/language_selector_screen.dart';
import 'package:conejoz/src/front_end/screens/settings_screen/theme_selector_screen.dart';
import 'package:conejoz/src/back_end/repositories/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
        title: Text("Settings",
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(
              'Language',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('Change the app\'s language'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LangSelector(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(
              'Theme',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('Change the app\'s theme'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThemeSelector(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline_rounded),
            title: Text(
              'About',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('Interesting stuff here'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConejozManual(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('See you later rabbit'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
            onTap: () {
              AuthenticationRepository.instance.logout();
            },
          ),
        ],
      ),
    );
  }
}
