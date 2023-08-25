import 'package:conejoz/src/features/feed/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

double regularSpacer = 25;
String isPublic = "Public";
String isPrivate = "Private";

class EntryPublisher extends StatefulWidget {
  final Map<String, dynamic> entry;

  const EntryPublisher({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  State<EntryPublisher> createState() => _EntryPublisherState();
}

class _EntryPublisherState extends State<EntryPublisher> {
  String entryStatus = isPrivate;

  @override
  Widget build(BuildContext context) {
    Get.put(UserRepository());
    final entryId = widget.entry['entryid']; // Get the entry ID from the widget
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Text("Entry Status: "),
                      Text(entryStatus),
                    ],
                  ),
                  Spacer(),
                  Card(
                    color: Theme.of(context).colorScheme.secondary,
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor:
                          Theme.of(context).colorScheme.onSurfaceVariant,
                      onTap: () {
                        setState(() {
                          entryStatus =
                              entryStatus == isPublic ? isPrivate : isPublic;
                        });
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Icon(
                            entryStatus == isPublic ? Icons.public : Icons.lock,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await UserRepository.instance
                        .createPublicDream(widget.entry);
                  } catch (error) {
                    // Handle error
                  }
                },
                child: Text("Test of creating entry"),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await UserRepository.instance.deletePublicDream(entryId);
                  } catch (error) {
                    // Handle error
                  }
                },
                child: Text("Test of deleting entry"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
