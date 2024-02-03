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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Theme.of(context).colorScheme.background,
                    Theme.of(context).colorScheme.primary,
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.primary,
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
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
