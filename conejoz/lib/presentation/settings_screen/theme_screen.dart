import 'package:conejoz/components/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("T H E M E"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button to switch themes',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            Provider.of<ThemeService>(context, listen: false).switchTheme,
        tooltip: 'Increment',
        child: const Icon(Icons.adb_rounded),
      ),
    );
  }
}
