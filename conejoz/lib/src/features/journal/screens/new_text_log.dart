import 'package:conejoz/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTextLog extends StatefulWidget {
  const NewTextLog({Key? key}) : super(key: key);

  @override
  State<NewTextLog> createState() => _NewTextLogState();
}

class _NewTextLogState extends State<NewTextLog> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _tagsEditingController = TextEditingController();

  @override
  void dispose() {
    _titleEditingController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    final userRepo = Get.find<UserRepository>();

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not authenticated.");
      return;
    }

    final userUniqueId = user.uid;

    final tags =
        _tagsEditingController.text.replaceAll(',', '').trim().split(' ');

    final now = DateTime.now();

    final entryId = const Uuid().v4();

    try {
      await userRepo.saveNote(userUniqueId, {
        'title': _titleEditingController.text,
        'dreamdescription': _textEditingController.text,
        'tags': tags,
        'timestamp': now,
        'entryid': entryId,
        'attachments': [],
      });

      // Note saved successfully, navigate back or perform any desired action.
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text("+",
              style: TextStyle(color: Theme.of(context).colorScheme.surface))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _titleEditingController,
              decoration: const InputDecoration(
                hintText: 'Entry title',
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
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Entry',
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
          onPressed: _saveNote,
          child: Icon(
              color: Theme.of(context).colorScheme.onPrimary,
              Icons.check_circle_outline)),
    );
  }
}
