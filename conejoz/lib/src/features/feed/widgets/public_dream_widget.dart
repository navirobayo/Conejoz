import 'package:flutter/material.dart';

class PublicDreamWidget extends StatefulWidget {
  final String rabbit;
  final String textentry;
  final String title;
  final String timestamp;
  final String tags;
  const PublicDreamWidget({
    Key? key,
    required this.rabbit,
    required this.textentry,
    required this.title,
    required this.timestamp,
    required this.tags,
  }) : super(key: key);

  @override
  _PublicDreamWidgetState createState() => _PublicDreamWidgetState();
}

class _PublicDreamWidgetState extends State<PublicDreamWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.rabbit,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              const Spacer(),
              Text(
                widget.timestamp,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.surface),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/conejoz-0000.appspot.com/o/DREAM_PICTURES%2Fdream_image_1691514996955.jpg?alt=media&token=efc0c98e-0600-406e-a215-7bf0ce9c3e89'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.titleMedium?.fontWeight,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text("("),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Do nothing here, as we want to show the popup menu immediately
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onSecondary,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    widget.tags,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  // Handle tag selection if needed
                },
                itemBuilder: (BuildContext context) {
                  return widget.tags.split(', ').map((tag) {
                    return PopupMenuItem<String>(
                      value: tag,
                      child: Text(tag),
                    );
                  }).toList();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
