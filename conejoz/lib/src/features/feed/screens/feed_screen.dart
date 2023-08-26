import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conejoz/src/features/feed/screens/tags_explorer.dart';
import 'package:conejoz/src/features/feed/widgets/public_dream_widget.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Public Logs.",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
        ),
        actions: [
          Card(
            color: Theme.of(context).colorScheme.secondary,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.surface,
              onTap: () {
                // This button will refresh the feed
              },
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.language,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Card(
            color: Theme.of(context).colorScheme.secondary,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.onSurface,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TagsExplorer(),
                  ),
                );
              },
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.tag,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("publicdreams") // Updated collection name
                    .orderBy("timestamp", descending: true)
                    .limit(10)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data!.docs[index];
                        final tags = List<String>.from(post["tags"] ?? []);
                        final tagsString = tags.join(
                            ', '); // Convert tags array to a single string
                        return PublicDreamWidget(
                          rabbit: post["rabbit"],
                          textentry: post["textentry"],
                          title: post["title"],
                          timestamp: post["timestamp"],
                          tags: tagsString,
                          dreamimage: post["dreamimage"],
                          attachments:
                              List<String>.from(post["attachments"] ?? []),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
