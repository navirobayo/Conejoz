import 'package:conejoz/src/features/journal/screens/log_dashboard.dart';
import 'package:conejoz/src/repository/authentication_repository/authentication_repository.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogsList extends StatelessWidget {
  const LogsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = AuthenticationRepository.instance.firebaseUser.value;
    if (user == null) {
      print("User is not authenticated.");
      return const Scaffold(
        body: Center(
          child: Text("User is not authenticated."),
        ),
      );
    }

    final userId = user.uid;

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
          "Logs.",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: UserRepository.instance.getUserEntries(userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final entries = snapshot.data!;
            return _JournalManagerList(entries: entries);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _JournalManagerList extends StatelessWidget {
  final List<Map<String, dynamic>> entries;

  const _JournalManagerList({Key? key, required this.entries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return ListTile(
          title: Text(
            entry['title'] ?? '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          subtitle: Text(
            entry['tags']?.join(', ') ?? '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          trailing: Text(
            DateFormat('dd-MM-yy HH:mm:ss')
                .format(entry['timestamp']?.toDate()),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LogDashboard(entry: entry),
              ),
            );
          },
        );
      },
    );
  }
}
