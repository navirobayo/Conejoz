import 'package:conejoz/src/features/settings/offline_themes/flutter_atari_theme.dart';
import 'package:conejoz/src/features/settings/offline_themes/flutter_monokai_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<ThemeData> availableThemes = [
  FlutterMonokaiTheme.lightTheme,
  FlutterMonokaiTheme.darkTheme,
  FlutterAtariTheme.lightTheme,
  FlutterAtariTheme.darkTheme,
];

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key});

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
            Text(
              'Select any of the themes below to change the app\'s theme.',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                      height: 200,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.palette_outlined),
                            title: const Text('Monokai'),
                            onTap: () {
                              Get.changeTheme(FlutterMonokaiTheme.lightTheme);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.palette_outlined),
                            title: const Text('Atari'),
                            onTap: () {
                              Get.changeTheme(FlutterAtariTheme.lightTheme);
                            },
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
}
