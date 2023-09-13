import 'package:conejoz/main.dart';
import 'package:conejoz/src/constants/offline_themes/flutter_atari_theme.dart';
import 'package:conejoz/src/constants/offline_themes/flutter_monokai_theme.dart';
import 'package:conejoz/src/constants/theme_and_font_manager.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({
    Key? key,
  }) : super(key: key);

  @override
  _ThemeSelectorState createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  final themeAndFontManager = ThemeAndFontManager.instance;

  void _saveTheme(Tuple2<ThemeData, ThemeData> selectedThemes) {
    themeAndFontManager.setTheme(selectedThemes);
    runApp(const App());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Picker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Select a theme:',
            ),
          ),
          ListTile(
            title: Text('Monokai'),
            leading: Radio(
              value: Tuple2(
                FlutterMonokaiTheme.lightTheme,
                FlutterMonokaiTheme.darkTheme,
              ),
              groupValue: Tuple2(
                themeAndFontManager.selectedLightTheme,
                themeAndFontManager.selectedDarkTheme,
              ),
              onChanged: (Tuple2<ThemeData, ThemeData>? value) {
                if (value != null) {
                  setState(() {
                    final selectedThemes = value;
                    _saveTheme(selectedThemes);
                  });
                }
              },
            ),
          ),
          ListTile(
            title: Text('Atari'),
            leading: Radio(
              value: Tuple2(
                FlutterAtariTheme.lightTheme,
                FlutterAtariTheme.darkTheme,
              ),
              groupValue: Tuple2(
                themeAndFontManager.selectedLightTheme,
                themeAndFontManager.selectedDarkTheme,
              ),
              onChanged: (Tuple2<ThemeData, ThemeData>? value) {
                if (value != null) {
                  setState(() {
                    final selectedThemes = value;
                    _saveTheme(selectedThemes);
                  });
                }
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final selectedThemes = Tuple2(
                  themeAndFontManager.selectedLightTheme,
                  themeAndFontManager.selectedDarkTheme,
                );
                _saveTheme(selectedThemes);
              },
              child: Text('Save')),
        ],
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
