import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart';
import 'package:conejoz/src/front_end/global_components/custom_icons/custom_icons.dart';
import 'package:conejoz/src/front_end/global_components/offline_themes/flutter_midnight_neon_theme.dart';
import 'package:conejoz/src/front_end/global_components/offline_themes/flutter_monokai_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<ThemeData> availableThemes = [
  FlutterMonokaiTheme.lightTheme,
  FluttterMidnightNeonTheme.lightTheme,
];

//! If you add themes you need to update the User Repository functions.

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Theme Selector",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  SizedBox(
                      height: 200,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.palette_outlined),
                            title: const Text('Monokai'),
                            onTap: () {
                              UserRepository.instance
                                  .updateUserAppTheme('monokai');
                              Get.changeTheme(FlutterMonokaiTheme.lightTheme);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.palette_outlined),
                            title: const Text('Atari'),
                            onTap: () {
                              UserRepository.instance
                                  .updateUserAppTheme('atari');
                              Get.changeTheme(
                                  FluttterMidnightNeonTheme.lightTheme);
                            },
                          ),
                        ],
                      )),
                );
              },
              child: const Icon(ConejozLogos.conejozBlackFill),
            ),
          ],
        ),
      ),
    );
  }
}

/* final List<ThemeData> availableThemes = [
  FlutterMonokaiTheme.lightTheme,
  FlutterAtariTheme.lightTheme,
];

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Theme Selector"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  SizedBox(
                      height: 200,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.palette_outlined),
                            title: const Text('Monokai'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.palette_outlined),
                            title: const Text('Atari'),
                            onTap: () {},
                          ),
                        ],
                      )),
                );
              },
              child: const Text('Select Theme'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        tooltip: 'done',
        child: const Icon(Icons.check),
      ),
    );
  }
} */
