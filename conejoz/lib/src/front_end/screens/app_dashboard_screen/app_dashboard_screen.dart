import 'package:conejoz/src/front_end/global_components/custom_icons/custom_icons.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/journal_screen.dart';
import 'package:conejoz/src/front_end/screens/public_feed_screen/public_feed_screen.dart';
import 'package:conejoz/src/front_end/screens/settings_screen/settings_screen.dart';
import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart';
import 'package:flutter/material.dart';

//* Main Screen of the app.

class ConejozDashboard extends StatefulWidget {
  const ConejozDashboard({super.key});

  @override
  State<ConejozDashboard> createState() => _ConejozDashboardState();
}

class _ConejozDashboardState extends State<ConejozDashboard> {
  final _userRepo = UserRepository.instance;
  String? _username;
  @override
  void initState() {
    super.initState();
    // Trigger the function to get the username once the screen is opened
    _getUsername();
  }

  // Function to retrieve the username from the UserRepository
  void _getUsername() async {
    final username = await _userRepo.getRabbitNameByUserId();
    setState(() {
      _username = username ?? "";
    });
  }

  // Index of the current screen
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Text("Welcome",
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            const SizedBox(width: 5),
            Text(
              _username ?? "Loading...",
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          FeedScreen(),
          JournalMenu(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                ConejozLogos.conejozBlackFill,
                color: _currentIndex == 0
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.circle_outlined,
                color: _currentIndex == 1
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
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
