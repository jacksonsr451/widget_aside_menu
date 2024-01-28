import 'package:flutter/material.dart';

class SideMenuIcon extends StatefulWidget {
  final IconData icon;
  final int index;
  final bool isSelected;
  final Function(int) onTap;
  final VoidCallback toggleSubmenuVisibility;

  const SideMenuIcon({
    required this.icon,
    required this.index,
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
      child: Row(
        children: [
          Container(
            width: 3,
            height: 30,
            margin: const EdgeInsets.only(right: 5, left: 1),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? const Color(0xFFECEEF0)
                  : Colors.transparent,
            ),
          ),
          IconButton(
            icon: Icon(
              widget.icon,
              size: 16,
              color: const Color(0xFFECEEF0),
            ),
            onPressed: () {
              widget.onTap(widget.index);
              widget.toggleSubmenuVisibility();
            },
          ),
        ],
      ),
    );
  }
}
