import 'package:flutter/material.dart';

class ReadEntryScreen extends StatefulWidget {
  final Map<String, dynamic> entry;

  const ReadEntryScreen({Key? key, required this.entry}) : super(key: key);

  @override
  State<ReadEntryScreen> createState() => _ReadEntryScreenState();
}

class _ReadEntryScreenState extends State<ReadEntryScreen> {
  @override
  Widget build(BuildContext context) {
    String title = widget.entry['title'];
    String tags = widget.entry['tags']?.join(', ') ?? '';
    String dreamdescription = widget.entry['dreamdescription'];
    return Scaffold(
      body: ListView(
        children: [
          Text(title,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          SizedBox(height: 10),
          Text(
            tags,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          SizedBox(height: 10),
          Text(dreamdescription,
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
        ],
      ),
    );
  }
}
