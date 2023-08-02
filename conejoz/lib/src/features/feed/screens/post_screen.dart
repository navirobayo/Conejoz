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
    return Row(
      children: [
        Text(rabbit),
        Text(dream),
        Text(title),
        Text(time),
        Text(caption),
      ],
    );
  }
}
