import 'package:flutter/material.dart';
import 'package:widget_aside_menu/components/submenu_list.dart';

class SubmenuWidget extends StatefulWidget {
  final String title;
  final List<Map<String, Object>> submenu;

  const SubmenuWidget({
    required this.title,
    required this.submenu,
    Key? key,
  }) : super(key: key);

  @override
  State<SubmenuWidget> createState() => _SubmenuWidgetState();
}

class _SubmenuWidgetState extends State<SubmenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: SubmenuList(
        title: widget.title,
        submenu: widget.submenu,
      ),
    );
  }
}
