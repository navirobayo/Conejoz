import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final String rabbit;
  final String dream;
  final String title;
  final String time;
  final String caption;
  const PostScreen(
      {super.key,
      required this.rabbit,
      required this.dream,
      required this.title,
      required this.time,
      required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(rabbit),
              const Spacer(),
              Text(time),
            ],
          ),
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
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight:
                      Theme.of(context).textTheme.titleMedium?.fontWeight,
                ),
              ),
              Text(
                caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
