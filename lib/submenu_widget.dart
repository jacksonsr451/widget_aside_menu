import 'package:flutter/material.dart';
import 'package:widget_aside_menu/submenu_list.dart';

class SubmenuWidget extends StatefulWidget {
  const SubmenuWidget({Key? key}) : super(key: key);

  @override
  State<SubmenuWidget> createState() => _SubmenuWidgetState();
}

class _SubmenuWidgetState extends State<SubmenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      decoration: const BoxDecoration(
        color: Color(0xFF333954),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: const SubmenuList(),
    );
  }
}
