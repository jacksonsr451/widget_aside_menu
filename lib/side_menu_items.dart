import 'package:flutter/material.dart';
import 'package:widget_aside_menu/side_menu_icon.dart';
import 'package:widget_aside_menu/submenu_widget.dart';

class SideMenuItems extends StatefulWidget {
  final bool isSubmenuVisible;
  final VoidCallback toggleSubmenuVisibility;
  final List listMenu;

  const SideMenuItems({
    required this.isSubmenuVisible,
    required this.toggleSubmenuVisibility,
    required this.listMenu,
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenuItems> createState() => _SideMenuItemsState();
}

class _SideMenuItemsState extends State<SideMenuItems> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    double space = 1.0 * 5;

    return Container(
      width: widget.isSubmenuVisible ? 245 : 60,
      margin: EdgeInsets.only(left: space, top: space, bottom: space),
      decoration: BoxDecoration(
        color: const Color(0xFF333954),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF494F6B),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 70),
              child: ListView(
                children: List.generate(
                  widget.listMenu.length,
                  (index) => SideMenuIcon(
                    icon: widget.listMenu[index],
                    index: index,
                    isSelected: index == _selectedIndex,
                    toggleSubmenuVisibility: widget.toggleSubmenuVisibility,
                    onTap: (int selectedIndex) {
                      setState(() {
                        _selectedIndex = selectedIndex;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          if (widget.isSubmenuVisible) const SubmenuWidget(),
        ],
      ),
    );
  }
}
