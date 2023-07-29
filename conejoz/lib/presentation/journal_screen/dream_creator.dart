import 'package:flutter/material.dart';

class DreamCreator extends StatefulWidget {
  const DreamCreator({Key? key});

  @override
  _DreamCreatorState createState() => _DreamCreatorState();
}

class _DreamCreatorState extends State<DreamCreator> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 16),
            Stack(
              children: <Widget>[
                //Container that will display a network image
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://play-lh.googleusercontent.com/BkHn39ghQsFdng88fhpWW41gwn2ZsFRmEMAtuOZ4scDFR6RI7af8OCSwdN0DxHJsp4Nq=w3840-h2160-rw'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      // TODO: Refresh the network image
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      // TODO: Discard the current image
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Write your entry here.',
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final String note = _textEditingController.text;
                // TODO: Save the note to the database
                Navigator.pop(context, note);
              },
              child: const Text('Save text'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Trigger image creation based on the note input.
              },
              child: const Text('Create image'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Trigger image creation based on the note input.
              },
              child: const Text('Save dream'),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
