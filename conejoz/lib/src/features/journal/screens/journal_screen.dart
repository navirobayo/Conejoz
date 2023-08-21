import 'package:conejoz/src/common_widgets/conejoz_route_button.dart';
import 'package:conejoz/src/common_widgets/conejoz_text_for_route_button.dart';
import 'package:conejoz/src/features/dream_creator/screens/dream_image_creator.dart';
import 'package:conejoz/src/features/dream_creator/screens/dream_text_entry.dart';
import 'package:conejoz/src/features/journal/screens/journal_manager.dart';
import 'package:conejoz/src/features/journal/screens/user_gallery.dart';
import 'package:conejoz/src/features/tags_explorer/screens/tags_explorer_screen.dart';
import 'package:flutter/material.dart';

//* Main features of the app.

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
          "Journal.",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
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
                        ConejozTextForRouteButton(
                            text: "New Text Entry", context: context),
                        SizedBox(height: defaultTextSpacer),
                        ConejozTextForRouteButton(
                            text: "AI Image", context: context),
                        SizedBox(height: defaultTextSpacer),
                        /*_buildText("New Audio Entry", context),
                        SizedBox(height: defaultTextSpacer),*/
                        ConejozTextForRouteButton(
                            text: "Logs", context: context),
                        SizedBox(height: defaultTextSpacer),
                        ConejozTextForRouteButton(
                            text: "Images Gallery", context: context),
                        SizedBox(height: defaultTextSpacer),
                        ConejozTextForRouteButton(
                            text: "Tags Explorer", context: context),
                      ],
                    ),
                  ),
                  // Right Column: Card Buttons
                  Expanded(
                    flex: 1, // Takes half of the available space
                    child: Column(
                      children: [
                        ConejozRouteButton(
                            context: context,
                            icon: Icons.create_rounded,
                            page: TextEntry()),
                        SizedBox(height: defaultCardSpacer),
                        ConejozRouteButton(
                            context: context,
                            icon: Icons.memory_sharp,
                            page: ImageCreator()),
                        SizedBox(height: defaultCardSpacer),
                        ConejozRouteButton(
                            context: context,
                            icon: Icons.book,
                            page: JournalManager()),
                        SizedBox(height: defaultCardSpacer),
                        ConejozRouteButton(
                            context: context,
                            icon: Icons.image_search_rounded,
                            page: UserGallery()),
                        SizedBox(height: defaultCardSpacer),
                        ConejozRouteButton(
                            context: context,
                            icon: Icons.tag,
                            page: TagsExplorer()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
