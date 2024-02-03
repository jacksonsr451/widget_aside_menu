import 'package:flutter/material.dart';
import 'package:widget_aside_menu/components/submenu_item.dart';
import 'package:widget_aside_menu/components/submenu_title.dart';

class SubmenuList extends StatefulWidget {
  final String title;
  final List<Map<String, Object>> submenu;

  const SubmenuList({
    required this.title,
    required this.submenu,
    Key? key,
  }) : super(key: key);

  @override
  State<SubmenuList> createState() => _SubmenuListState();
}

class _SubmenuListState extends State<SubmenuList> {
  late int? _selectedIndex;
  late int _lastIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = null;
    _lastIndex = widget.submenu.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubmenuTitle(
          title: widget.title,
          hasTopBorderRadius: _selectedIndex == 0,
        ),
        Column(
          children: List.generate(
            widget.submenu.length,
            (index) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF333954),
                    Color(0xFF272e4b),
                  ],
                ),
              ),
              child: SubmenuItem(
                title: widget.submenu[index]['title'] as String,
                index: index,
                selectedIndex: _selectedIndex,
                onTap: (int tappedIndex, int? previousIndex, int? nextIndex) {
                  setState(() {
                    _selectedIndex = tappedIndex;
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF333954),
                Color(0xFF272e4b),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF333954),
              borderRadius: BorderRadius.only(
                topRight:
                    Radius.circular(_selectedIndex == _lastIndex ? 20 : 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
