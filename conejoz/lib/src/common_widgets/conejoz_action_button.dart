import 'package:flutter/material.dart';

class ConejozActionButton extends StatelessWidget {
  const ConejozActionButton({
    super.key,
    required this.context,
    required this.icon,
    required this.function,
  });

  final BuildContext context;
  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: () {
          function();
        },
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Icon(
              color: Theme.of(context).colorScheme.onPrimary,
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
