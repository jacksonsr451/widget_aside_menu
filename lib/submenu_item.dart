import 'package:flutter/material.dart';

class SubmenuItem extends StatefulWidget {
  final String title;
  final int index;
  final int? selectedIndex;
  final Function(int, int?, int?) onTap;

  const SubmenuItem({
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<SubmenuItem> createState() => _SubmenuItemState();
}

class _SubmenuItemState extends State<SubmenuItem> {
  @override
  Widget build(BuildContext context) {
    const double padding = 10;

    bool isSelected = false;
    bool isPreviousSelected = false;
    bool isNextSelected = false;

    if (widget.selectedIndex != null) {
      isSelected = widget.index == widget.selectedIndex!;
      isPreviousSelected = widget.index == widget.selectedIndex! - 1;
      isNextSelected = widget.index == widget.selectedIndex! + 1;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.onTap(
              widget.index,
              isPreviousSelected ? widget.index - 1 : null,
              isNextSelected ? widget.index + 1 : null);
        },
        child: Container(
          width: 245,
          padding:
              const EdgeInsets.only(left: 18, top: padding, bottom: padding),
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFF272e4b) : const Color(0xFF333954),
            borderRadius: isSelected
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : BorderRadius.only(
                    bottomRight: Radius.circular(isPreviousSelected ? 25.0 : 0),
                    topRight: Radius.circular(isNextSelected ? 25.0 : 0),
                  ),
          ),
          child: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFFECEEF0),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
