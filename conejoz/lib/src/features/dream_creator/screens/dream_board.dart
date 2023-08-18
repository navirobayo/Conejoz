import 'package:conejoz/src/features/dream_creator/screens/dream_audio_entry.dart';
import 'package:conejoz/src/features/dream_creator/screens/dream_file_creator.dart';
import 'package:conejoz/src/features/dream_creator/screens/dream_image_creator.dart';
import 'package:conejoz/src/features/dream_creator/screens/dream_text_entry.dart';
import 'package:flutter/material.dart';

class DreamBoard extends StatefulWidget {
  const DreamBoard({super.key});

  @override
  State<DreamBoard> createState() => _DreamBoardState();
}

class _DreamBoardState extends State<DreamBoard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ImageCreator(),
          TextEntry(),
          // AudioEntry(), Not implemented yet.
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.donut_large_sharp,
                  color: _currentIndex == 0
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.notes_outlined,
                  color: _currentIndex == 1
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              /*IconButton( Not implemented yet. 
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.mic,
                  color: _currentIndex == 2 ? Colors.black : Colors.grey,
                ),
              ),*/
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DreamFileCreator(),
              ),
            );
          },
          label: Text("Finish Dream")),
    );
  }
}
