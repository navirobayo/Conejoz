import 'package:flutter/material.dart';

class LogVisualizer extends StatefulWidget {
  final Map<String, dynamic> entry;

  const LogVisualizer({Key? key, required this.entry}) : super(key: key);

  @override
  State<LogVisualizer> createState() => _LogVisualizerState();
}

class _LogVisualizerState extends State<LogVisualizer> {
  @override
  Widget build(BuildContext context) {
    String title = widget.entry['title'];
    String tags = widget.entry['tags']?.join(', ') ?? '';
    String dreamdescription = widget.entry['dreamdescription'];
    final attachments = widget.entry['attachments'] ?? <String>[];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Text(title,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
            const SizedBox(height: 5),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  flex: 3,
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
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
            const SizedBox(height: 10),
            Text(dreamdescription,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary)),
          ],
        ),
      ),
    );
  }
}
