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
          color: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Settings",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant)),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.language_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LangSelector(),
                  ),
                );
              },
            ),
            title: Text(
              'Language',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('Change journal\'s language'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.palette_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThemeSelector(),
                  ),
                );
              },
            ),
            title: Text(
              'Theme',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('Change journal\'s theme'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.help_outline_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConejozManual(),
                  ),
                );
              },
            ),
            title: Text(
              'Manual',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('Some cool stuff here'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.info_outline_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
            title: Text(
              'About',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('What\'s Conejoz anyway?'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('See you later rabbitz'),
            trailing: Icon(Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
