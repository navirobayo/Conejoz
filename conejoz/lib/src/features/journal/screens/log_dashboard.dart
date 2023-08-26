import 'package:conejoz/src/constants/conejoz_logos.dart';
import 'package:conejoz/src/features/journal/screens/log_editor.dart';
import 'package:conejoz/src/features/journal/screens/log_publisher.dart';
import 'package:conejoz/src/features/journal/screens/log_visualizer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogDashboard extends StatefulWidget {
  final Map<String, dynamic> entry;

  const LogDashboard({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  State<LogDashboard> createState() => _LogDashboardState();
}

class _LogDashboardState extends State<LogDashboard> {
  // Index of the current screen
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
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
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
