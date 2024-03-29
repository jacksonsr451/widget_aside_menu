import 'package:flutter/material.dart';

class SubmenuTitle extends StatelessWidget {
  final String title;
  final bool hasTopBorderRadius;

  const SubmenuTitle({
    required this.title,
    required this.hasTopBorderRadius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.tertiary,
          ],
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        width: 185,
        padding: const EdgeInsets.only(top: 25.00, right: 50, bottom: 25.00),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(20),
            bottomRight: Radius.circular(hasTopBorderRadius ? 20.0 : 0),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
