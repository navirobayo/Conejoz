import 'package:flutter/material.dart';

class ConejozManual extends StatelessWidget {
  const ConejozManual({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Some interesting functonalities of Conejoz:"),
          Text(
              "The default cover for the public entry is the first available attachment in the entry."),
          Text(
              "The timestamps are synchronized to a global and common timezone so that the entries are sorted chronologically."),
        ],
      ),
    );
  }
}
