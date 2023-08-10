import 'package:conejoz/src/features/feed/screens/feed_screen.dart';
import 'package:conejoz/src/features/journal/screens/journal_screen.dart';
import 'package:conejoz/src/features/profile/screens/profile_screen.dart';
import 'package:conejoz/src/features/settings/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class ConejozDashboard extends StatefulWidget {
  const ConejozDashboard({super.key});

  @override
  State<ConejozDashboard> createState() => _ConejozDashboardState();
}

class _ConejozDashboardState extends State<ConejozDashboard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.code_rounded),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Conejoz Dashboard"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          FeedScreen(),
          JournalScreen(),
          ProfileScreen(), // RABBIT ICON FOR THIS SCREEN
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_food_beverage_rounded),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu_book_sharp),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.adjust_outlined),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
