import 'package:conejoz/src/features/dream_creator/screens/dream_image_creator.dart';
import 'package:conejoz/src/features/dream_creator/screens/dream_text_entry.dart';
import 'package:conejoz/src/features/journal/screens/journal_manager.dart';
import 'package:conejoz/src/features/journal/screens/user_gallery.dart';
import 'package:conejoz/src/features/tags_explorer/screens/tags_explorer_screen.dart';
import 'package:flutter/material.dart';

double defaultTextSpacer = 60;
double defaultCardSpacer = 20;

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Cloud Journal",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Container(
              child: Row(
                children: [
                  // Left Column: Text Widgets
                  Expanded(
                    flex: 1, // Takes half of the available space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildText("New Text Entry", context),
                        SizedBox(height: defaultTextSpacer),
                        _buildText("AI Image", context),
                        SizedBox(height: defaultTextSpacer),
                        /*_buildText("New Audio Entry", context),
                        SizedBox(height: defaultTextSpacer),*/
                        _buildText("Entries", context),
                        SizedBox(height: defaultTextSpacer),
                        _buildText("Images Explorer", context),
                        SizedBox(height: defaultTextSpacer),
                        _buildText("Tags Explorer", context),
                      ],
                    ),
                  ),
                  // Right Column: Card Buttons
                  Expanded(
                    flex: 1, // Takes half of the available space
                    child: Column(
                      children: [
                        _buildCardButton(
                            context, Icons.create_rounded, TextEntry()),
                        SizedBox(height: defaultCardSpacer),
                        _buildCardButton(
                            context, Icons.memory_sharp, ImageCreator()),
                        SizedBox(height: defaultCardSpacer),
                        _buildCardButton(context, Icons.book, JournalManager()),
                        SizedBox(height: defaultCardSpacer),
                        _buildCardButton(
                            context, Icons.image_search_rounded, UserGallery()),
                        SizedBox(height: defaultCardSpacer),
                        _buildCardButton(context, Icons.tag, TagsExplorer()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildText(String text, BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.surface,
        fontSize: 15,
      ),
    );
  }

  Widget _buildCardButton(BuildContext context, IconData icon, Widget page) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Icon(
              color: Theme.of(context).colorScheme.onPrimary,
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
