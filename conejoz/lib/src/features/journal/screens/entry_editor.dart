import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conejoz/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EntryEditor extends StatefulWidget {
  final Map<String, dynamic> entry;

  const EntryEditor({
    Key? key,
    required this.entry,
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

  @override
  Widget build(BuildContext context) {
    final entryDate = widget.entry['timestamp']?.toDate();
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
          DateFormat('yy-MM-dd HH:mm:ss').format(entryDate ?? DateTime.now()),
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _titleEditingController,
              decoration: const InputDecoration(
                hintText: 'EXISTING TITLE',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _tagsEditingController,
              decoration: const InputDecoration(
                hintText: 'EXISTING TAGS',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'EXISTING TEXT',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16),
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
