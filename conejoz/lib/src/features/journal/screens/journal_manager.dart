import 'package:flutter/material.dart';

class JournalManager extends StatefulWidget {
  const JournalManager({super.key});

  @override
  State<JournalManager> createState() => _JournalManagerState();
}

class _JournalManagerState extends State<JournalManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Journal Manager"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Theme.of(context).cardColor,
                onTap: () {},
                child: const SizedBox(
                  width: 300,
                  height: 150,
                  child: Center(child: Text("Here goes a list of entries.")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
