import 'package:conejoz/src/front_end/global_components/app_strings/global_strings.dart';
import 'package:flutter/material.dart';

class ConejozManual extends StatelessWidget {
  const ConejozManual({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Text(
            "Some interesting functonalities and mechanisms of this $appVersion version:",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "* The timestamps are synchronized with a global and common timezone so that the entries are sorted chronologically, independently from the region that are uploaded.",
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "* You can now change the app's theme and it will be synchronized with the cloud, sorry for the delay!!!",
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "* You can now update your profile information, synchronized also with the cloud. Isn't that just amazing?",
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "I hope that you find Conejoz helpful. If you require an specific feature please let me know. I would like to check on it. Peace and good dreaming -Lazarus",
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ],
      ),
    );
  }
}
