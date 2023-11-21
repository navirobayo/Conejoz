import 'package:conejoz/src/front_end/global_components/custom_widgets/conejoz_route_button.dart';
import 'package:conejoz/src/front_end/global_components/custom_widgets/conejoz_text_for_route_button.dart';
import 'package:conejoz/src/front_end/global_components/custom_icons/custom_icons.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/image_creator_screen.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/logs_list_screen.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/new_text_log_screen.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/user_gallery_screen.dart';
import 'package:conejoz/src/front_end/screens/journal_screen/user_profile_screen.dart';
import 'package:flutter/material.dart';

//* Main features of the app.

double defaultTextSpacer = 60;
double defaultCardSpacer = 20;

class JournalMenu extends StatelessWidget {
  const JournalMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Journal.",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface, fontSize: 18),
        ),
        automaticallyImplyLeading: false,
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
                            text: "New Log", context: context),
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
                            text: "Rabbit", context: context),
                        SizedBox(height: defaultTextSpacer),
                        ConejozTextForRouteButton(
                            text: "Images Gallery", context: context),
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
                            page: NewTextLog()),
                        SizedBox(height: defaultCardSpacer),
                        ConejozRouteButton(
                            context: context,
                            icon: Icons.memory_sharp,
                            page: ImageCreator()),
                        SizedBox(height: defaultCardSpacer),
                        ConejozRouteButton(
                            context: context,
                            icon: Icons.book,
                            page: LogsList()),
                        SizedBox(height: defaultCardSpacer),
                        ConejozRouteButton(
                            context: context,
                            icon: ConejozLogos.conejozBlackFill,
                            page: UserProfile()),
                        SizedBox(height: defaultCardSpacer),
                        ConejozRouteButton(
                            context: context,
                            icon: Icons.image_search_rounded,
                            page: UserGallery()),
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
