import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryEditor extends StatefulWidget {
  final Map<String, dynamic> entry;
  final Function onImagePicked;

  const EntryEditor({
    Key? key,
    required this.entry,
    required this.onImagePicked,
  }) : super(key: key);

  @override
  State<EntryEditor> createState() => _EntryEditorState();
}

class _EntryEditorState extends State<EntryEditor> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _tagsEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleEditingController.text = widget.entry['title'] ?? '';
    _textEditingController.text = widget.entry['dreamdescription'] ?? '';
    _tagsEditingController.text = widget.entry['tags']?.join(', ') ?? '';
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    _textEditingController.dispose();
    _tagsEditingController.dispose();
    super.dispose();
  }

  void updateNote() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not authenticated.");
      return;
    }

    final userId = user.uid;
    final entryId = widget.entry['uniqueid'];
    final title = _titleEditingController.text;
    final tags =
        _tagsEditingController.text.split(',').map((e) => e.trim()).toList();
    final dreamdescription = _textEditingController.text;
    final timestamp = Timestamp.now();

    final updatedEntryData = {
      'entryid': entryId,
      'title': title,
      'tags': tags,
      'dreamdescription': dreamdescription,
      'timestamp': timestamp,
    };

    try {
      await UserRepository.instance
          .updateEntry(userId, entryId, updatedEntryData);
      Get.snackbar("Success", "Entry updated",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    } catch (error) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    }

    Navigator.pop(context);
  }

  void showAttachmentOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Attachment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Create new AI Image"),
                  onTap: () {
                    // Navigate to AI image creator
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("AI Image already exists"),
                  onTap: () {
                    widget.onImagePicked();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _titleEditingController,
              decoration: const InputDecoration(
                hintText: 'A fancy title',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _tagsEditingController,
              decoration: const InputDecoration(
                hintText: 'Tags separated by commas',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: 10),
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
                                          "https://firebasestorage.googleapis.com/v0/b/conejoz-0000.appspot.com/o/DREAM_PICTURES%2Fdream_image_1691561892499.jpg?alt=media&token=7ed46836-050d-4090-8785-6473e5146cf1",
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
                                    "https://firebasestorage.googleapis.com/v0/b/conejoz-0000.appspot.com/o/DREAM_PICTURES%2Fdream_image_1691561892499.jpg?alt=media&token=7ed46836-050d-4090-8785-6473e5146cf1",
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
                IconButton(
                    onPressed: showAttachmentOptions,
                    icon: Icon(Icons.add_link)),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'What are you dreaming?',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16),
            // A container that suggest that attachments are available.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          splashColor: Theme.of(context).colorScheme.surface,
          backgroundColor: Theme.of(context).colorScheme.onError,
          onPressed: updateNote,
          child: Icon(
              color: Theme.of(context).colorScheme.onPrimary,
              Icons.check_circle_outline)),
    );
  }
}
