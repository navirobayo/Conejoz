import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("About"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Conejoz Ver 1.0.0',
            ),
            Text(
              'For dreamers by dreamers. \n Created with passion by Ivan Robayo',
            ),
            Text(
              'github.com/navirobayo',
            ),
          ],
        ),
      ),
    );
  }
}
