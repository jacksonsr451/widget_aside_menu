import 'package:flutter/material.dart';
import 'package:widget_aside_menu/side_menu_items.dart';

class SideMenuWidget extends StatefulWidget {
  final List<Map<String, Object>> menu;

  const SideMenuWidget({
    required this.menu,
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  bool isSubmenuVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            isSubmenuVisible = false;
          });
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final screenWidth = constraints.maxWidth;
              final shouldShowSubmenu = screenWidth > 600 || isSubmenuVisible;

              return Stack(
                children: [
                  if (isSubmenuVisible)
                    Positioned(
                      child: Container(
                        color: Colors.transparent,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  SideMenuItems(
                    isSubmenuVisible: shouldShowSubmenu,
                    toggleSubmenuVisibility: () {
                      setState(() {
                        isSubmenuVisible = true;
                      });
                    },
                    listMenu: widget.menu,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
