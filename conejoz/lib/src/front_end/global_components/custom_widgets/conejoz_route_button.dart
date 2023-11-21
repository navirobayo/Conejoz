import 'package:flutter/material.dart';

//! Template of a customized widget that can handle routes.

class ConejozRouteButton extends StatelessWidget {
  const ConejozRouteButton({
    super.key,
    required this.context,
    required this.icon,
    required this.page,
  });

  final BuildContext context;
  final IconData icon;
  final Widget page;

  @override
  Widget build(BuildContext context) {
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
              color: Theme.of(context).colorScheme.onSurface,
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
