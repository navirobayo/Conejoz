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
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: EdgeInsets.all(25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(rabbit),
          Column(
            children: [
              Text(dream),
              Text(title),
              Text(time),
              Text(caption),
            ],
          ),
        ],
      ),
    );
  }
}
