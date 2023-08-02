import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conejoz/src/features/feed/screens/post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final currentRabbit = FirebaseAuth.instance.currentUser!;

  // Post message.
  void postMessage(String message, String caption) {
    // TODO: Add condition to see if there is a dream created.
    FirebaseFirestore.instance.collection("publicdreams").add({
      "Rabbit": currentRabbit.uid,
      "Dream": message,
      "Title": "Title",
      "TimeStamp": DateTime.now(),
      "Caption": caption,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Dreamscape"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("publicdreams") // Updated collection name
                    .orderBy("TimeStamp", descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data!.docs[index];
                        return PostScreen(
                          rabbit: post["Rabbit"],
                          dream: post["Dream"],
                          title: post["Title"],
                          time: post["TimeStamp"].toString(),
                          caption: post["Caption"],
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
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Dream',
              ),
              onFieldSubmitted: (value) {
                postMessage(value, value);
              },
            ),
            const SizedBox(height: 16),

            /*
            ElevatedButton( //Use this as a test. 
              onPressed: () {
                postMessage('Default message', 'Default caption');
              },
              child: const Text('Post Message'),
            ),
            */
          ],
        ),
      ),
    );
  }
}
