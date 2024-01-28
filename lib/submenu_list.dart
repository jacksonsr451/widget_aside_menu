import 'package:flutter/material.dart';
import 'package:widget_aside_menu/submenu_item.dart';
import 'package:widget_aside_menu/submenu_title.dart';

class SubmenuList extends StatefulWidget {
  const SubmenuList({Key? key}) : super(key: key);

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
    _lastIndex = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubmenuTitle(
          title: "Menu",
          hasTopBorderRadius: _selectedIndex == 0,
        ),
        Column(
          children: List.generate(
            5,
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
                title: 'Item $index',
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
