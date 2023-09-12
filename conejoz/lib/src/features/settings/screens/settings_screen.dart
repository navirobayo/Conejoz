import 'package:conejoz/src/features/settings/screens/about_screen.dart';
import 'package:conejoz/src/features/settings/screens/conejoz_manual.dart';
import 'package:conejoz/src/features/settings/screens/theme_selector.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
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
                // Navigate to the language settings screen.
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
              icon: const Icon(Icons.person),
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
              'Profile',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            subtitle: const Text('Customize that rabbit pal'),
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
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.help),
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
        ],
      ),
    );
  }
}
