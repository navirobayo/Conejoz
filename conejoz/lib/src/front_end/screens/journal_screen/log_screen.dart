import 'package:conejoz/src/front_end/global_components/custom_icons/custom_icons.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/log_editor_screen.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/log_publisher_screen.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/log_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogScreen extends StatefulWidget {
  final Map<String, dynamic> entry;

  const LogScreen({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    DateTime entryDate = widget.entry['timestamp']?.toDate();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          DateFormat('yy-MM-dd HH:mm:ss').format(entryDate),
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          LogVisualizer(
            entry: widget.entry,
          ),
          LogEditor(
            entry: widget.entry,
          ),
          LogPublisher(
            entry: widget.entry,
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.visibility,
                color: _currentIndex == 0
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.edit_note,
                color: _currentIndex == 1
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                ConejozLogos.conejozBlackFill,
                color: _currentIndex == 2
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
