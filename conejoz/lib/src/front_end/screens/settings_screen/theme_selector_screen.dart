import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart';
import 'package:conejoz/src/front_end/global_components/offline_themes/flutter_atari_theme.dart';
import 'package:conejoz/src/front_end/global_components/offline_themes/flutter_monokai_theme.dart';
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
