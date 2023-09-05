import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogReader extends StatelessWidget {
  final String rabbit;
  final String textentry;
  final String title;
  final Timestamp timestamp;
  final String tags;
  final String dreamimage;
  final List<String> attachments;

  const LogReader({
    Key? key,
    required this.rabbit,
    required this.textentry,
    required this.title,
    required this.timestamp,
    required this.tags,
    required this.dreamimage,
    required this.attachments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: [
              Row(children: [
                Text('Log reader'),
                Spacer(),
                Text(
                  DateFormat('dd-MM-yy HH:mm:ss').format(timestamp.toDate()),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                Spacer(),
                Text('Conejoz Ver. 0.0.1')
              ]),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final tag in tags.split(' '))
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                tag.trim(),
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: Card(
                      color: Theme.of(context).colorScheme.onError,
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(width: 10),
                            for (final attachment in attachments)
                              Card(
                                color: Theme.of(context).colorScheme.secondary,
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: SizedBox(
                                            child: Image.network(
                                              attachment,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: SizedBox(
                                    child: Center(
                                      child: Image.network(
                                        attachment,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize:
                        Theme.of(context).textTheme.titleMedium?.fontSize),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                textentry,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Text(rabbit,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surface)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
