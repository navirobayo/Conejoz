import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conejoz/src/front_end/screens/public_feed_screen/public_log_reader.dart';
import 'package:conejoz/src/front_end/screens/public_feed_screen/public_user_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PublicDreamWidget extends StatefulWidget {
  final String rabbit;
  final String textentry;
  final String title;
  final Timestamp timestamp;
  final String tags;
  final String dreamimage;
  final List<String> attachments;
  const PublicDreamWidget({
    Key? key,
    required this.rabbit,
    required this.textentry,
    required this.title,
    required this.timestamp,
    required this.tags,
    required this.dreamimage,
    required this.attachments,
  }) : super(key: key);

  @override
  _PublicDreamWidgetState createState() => _PublicDreamWidgetState();
}

class _PublicDreamWidgetState extends State<PublicDreamWidget> {
  void _onTitleTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogReader(
          rabbit: widget.rabbit,
          textentry: widget.textentry,
          title: widget.title,
          timestamp: widget.timestamp,
          tags: widget.tags,
          dreamimage: widget.dreamimage,
          attachments: widget.attachments,
        ),
      ),
    );
  }

  void _onImageTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogReader(
          rabbit: widget.rabbit,
          textentry: widget.textentry,
          title: widget.title,
          timestamp: widget.timestamp,
          tags: widget.tags,
          dreamimage: widget.dreamimage,
          attachments: widget.attachments,
        ),
      ),
    );
  }

  void _onUsernameTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RabbitCard(),
      ),
    );
  }

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
              GestureDetector(
                onTap: _onUsernameTap,
                child: Text(
                  widget.rabbit,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              const Spacer(),
              Text(
                DateFormat('dd-MM-yy HH:mm:ss')
                    .format(widget.timestamp.toDate()),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: _onTitleTap,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.dreamimage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: _onImageTap,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize:
                          Theme.of(context).textTheme.titleMedium?.fontSize,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "(",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Do nothing here, as we want to show the popup menu immediately
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap, // * What is this?
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.tags,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  onSelected: (value) {
                    // Handle tag selection if needed
                  },
                  itemBuilder: (BuildContext context) {
                    return widget.tags.split(', ').map((tag) {
                      return PopupMenuItem<String>(
                        value: tag,
                        child: Text(
                          tag,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
