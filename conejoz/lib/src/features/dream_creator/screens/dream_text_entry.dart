import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextEntry extends StatefulWidget {
  const TextEntry({Key? key}) : super(key: key);

  @override
  State<TextEntry> createState() => _TextEntryState();
}

class _TextEntryState extends State<TextEntry> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _titleEditingController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("New Note Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _titleEditingController,
              decoration: const InputDecoration(
                hintText: 'Create a title here.',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Write your entry here.',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
