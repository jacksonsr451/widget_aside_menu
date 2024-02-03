import 'package:flutter/material.dart';
import 'package:widget_aside_menu/components/side_menu_items.dart';

class SideMenuWidget extends StatefulWidget {
  final List<Map<String, Object>> menu;
  final Widget appBar;
  final Widget element;

  const SideMenuWidget({
    required this.menu,
    required this.appBar,
    required this.element,
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  bool isSubmenuVisible = false;
  double space = 1.0 * 5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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

            return Container(
              color: const Color(0xFF303757),
              padding: EdgeInsets.all(space),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF272e4a),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Stack(
                  children: [
                    if (isSubmenuVisible)
                      Positioned(
                        child: Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    Row(
                      children: [
                        SideMenuItems(
                          isSubmenuVisible: shouldShowSubmenu,
                          toggleSubmenuVisibility: () {
                            setState(() {
                              isSubmenuVisible = true;
                            });
                          },
                          listMenu: widget.menu,
                        ),
                        Column(
                          children: [
                            widget.appBar,
                            widget.element,
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
