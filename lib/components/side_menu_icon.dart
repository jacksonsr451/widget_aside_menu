import 'package:flutter/material.dart';
import 'package:widget_aside_menu/components/iconMap.dart';

class SideMenuIcon extends StatefulWidget {
  final String icon;
  final String title;
  final int index;
  final bool isSelected;
  final Function(int) onTap;
  final VoidCallback toggleSubmenuVisibility;

  const SideMenuIcon({
    required this.icon,
    required this.title,
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
                  ? Theme.of(context).textTheme.bodyLarge?.color
                  : Colors.transparent,
            ),
          ),
          IconButton(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 35,
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    iconMap[widget.icon],
                    size: 16,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                Container(
                  width: 35,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 5,
                    ),
                  ),
                ),
              ],
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
