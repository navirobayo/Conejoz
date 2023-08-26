import 'package:conejoz/src/features/feed/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';

double regularSpacer = 25;
String isPublic = "Public";
String isPrivate = "Private";

class LogPublisher extends StatefulWidget {
  final Map<String, dynamic> entry;

  const LogPublisher({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  State<LogPublisher> createState() => _LogPublisherState();
}

class _LogPublisherState extends State<LogPublisher> {
  String entryStatus = isPrivate;

  @override
  void initState() {
    super.initState();
    print("Fetching entry status...");
    fetchEntryStatus();
  }

  Future<void> fetchEntryStatus() async {
    final entryId = widget.entry['entryid'];
    final status = await UserRepository.instance.fetchEntryStatus(entryId);
    print("Entry status: $status");
    setState(() {
      entryStatus = status;
    });
  }

  Future<void> toggleEntryStatus() async {
    final entryId = widget.entry['entryid'];

    try {
      if (entryStatus == isPrivate) {
        // Check if the entry is private
        await UserRepository.instance.createPublicDream(widget.entry);
        print("Dream created successfully");
        setState(() {
          entryStatus = isPublic;
        });
      } else {
        // Entry is already public, so delete it
        await UserRepository.instance.deletePublicDream(entryId);
        print("Dream deleted successfully");
        setState(() {
          entryStatus = isPrivate;
        });
      }
    } catch (error) {
      // Handle error
    }
  }

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
                      onTap: () async {
                        if (entryStatus == isPrivate) {
                          try {
                            await UserRepository.instance
                                .createPublicDream(widget.entry);
                            setState(() {
                              entryStatus = isPublic;
                            });
                          } catch (error) {
                            // Handle error
                          }
                        } else if (entryStatus == isPublic) {
                          try {
                            await UserRepository.instance
                                .deletePublicDream(entryId);
                            setState(() {
                              entryStatus = isPrivate;
                            });
                          } catch (error) {
                            // Handle error
                          }
                        }
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Icon(
                            entryStatus == isPublic
                                ? Icons.visibility_off
                                : Icons.visibility,
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
            ],
          ),
        ),
      ),
    );
  }
}
