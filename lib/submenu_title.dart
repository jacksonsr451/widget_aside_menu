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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF333954),
            Color(0xFF272e4b),
          ],
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        width: 180,
        padding: const EdgeInsets.only(top: 25.00, right: 50, bottom: 25.00),
        decoration: BoxDecoration(
          color: const Color(0xFF333954),
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(20),
            bottomRight: Radius.circular(hasTopBorderRadius ? 20.0 : 0),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.end,
          style: const TextStyle(
            color: Color(0xFFECEEF0),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
