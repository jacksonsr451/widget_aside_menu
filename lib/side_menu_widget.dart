import 'package:flutter/material.dart';
import 'package:widget_aside_menu/components/side_menu_items.dart';

class SideMenuWidget extends StatefulWidget {
  final List<Map<String, Object>> menu;
  final void Function(Brightness) onThemeChange;
  final VoidCallback logout;
  final Widget appBar;
  final Widget element;

  const SideMenuWidget({
    required this.menu,
    required this.onThemeChange,
    required this.logout,
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
              color: Theme.of(context).colorScheme.background,
              padding: EdgeInsets.all(space),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
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
                          onThemeChange: widget.onThemeChange,
                          logout: widget.logout,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                widget.appBar,
                                widget.element,
                              ],
                            ),
                          ),
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
