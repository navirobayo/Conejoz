import 'package:flutter/material.dart';

//! Template of a customized widget that manages the text for the route button.

class ConejozTextForRouteButton extends StatelessWidget {
  const ConejozTextForRouteButton({
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
        color: Theme.of(context).colorScheme.primary,
        fontSize: 15,
      ),
    );
  }
}
