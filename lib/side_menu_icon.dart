import 'package:flutter/material.dart';

class SideMenuIcon extends StatefulWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback toggleSubmenuVisibility;

  const SideMenuIcon({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.toggleSubmenuVisibility,
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenuIcon> createState() => _SideMenuIcon();
}

class _SideMenuIcon extends State<SideMenuIcon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 29,
        margin: const EdgeInsets.only(bottom: 5),
        child: IconButton(
          icon: Icon(
            widget.icon,
            size: 16,
            color: const Color(0xFFECEEF0),
          ),
          onPressed: widget.toggleSubmenuVisibility,
        ),
      ),
    );
  }
}
