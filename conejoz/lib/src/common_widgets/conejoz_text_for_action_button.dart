import 'package:flutter/material.dart';

class ConejozTextForActionButton extends StatelessWidget {
  const ConejozTextForActionButton({
    super.key,
    required this.text,
    required this.context,
  });

  final String text;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.surface,
        fontSize: 15,
      ),
    );
  }
}
