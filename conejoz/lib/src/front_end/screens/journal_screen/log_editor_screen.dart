import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conejoz/src/back_end/repositories/user_repository/user_repository.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/image_creator_screen.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/images_selector_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogEditor extends StatefulWidget {
  final Map<String, dynamic> entry;

  const LogEditor({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  State<LogEditor> createState() => _LogEditorState();
}

class _LogEditorState extends State<LogEditor> {
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

  // ! Separate logic if possible.

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
    final attachments = widget.entry['attachments'] ?? <String>[];

    final updatedEntryData = {
      'entryid': entryId,
      'title': title,
      'tags': tags,
      'dreamdescription': dreamdescription,
      'timestamp': timestamp,
      'attachments': attachments,
    };

    try {
      await UserRepository.instance
          .updatePrivateLog(userId, entryId, updatedEntryData);
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

  void updatePublicNote() async {
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
    final attachments = widget.entry['attachments'] ?? <String>[];

    final updatedEntryData = {
      'entryid': entryId,
      'title': title,
      'tags': tags,
      'dreamdescription': dreamdescription,
      'timestamp': timestamp,
      'attachments': attachments,
    };

    try {
      await UserRepository.instance
          .updatePublicLog(userId, entryId, updatedEntryData);
    } catch (error) {
      print(error.toString());
    }
  }

  void showAttachmentOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("+"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text("Create new image"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageCreator(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text("Add image"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImagesSelector(
                          entryId: widget.entry['entryid'],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final attachments = widget.entry['attachments'] ?? <String>[];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Center(
                child: Text(
              "Edition mode ! Save your changes before leaving",
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            )),
            const SizedBox(height: 16),
            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              controller: _titleEditingController,
              decoration: const InputDecoration(
                hintText: 'Entry title',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 5),
            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
                IconButton(
                    onPressed: showAttachmentOptions,
                    icon: Icon(Icons.add_link)),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 5),
            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Entry',
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
          onPressed: () {
            updatePublicNote();
            updateNote();
          },
          child: Icon(
              color: Theme.of(context).colorScheme.onPrimary,
              Icons.check_circle_outline)),
    );
  }
}
