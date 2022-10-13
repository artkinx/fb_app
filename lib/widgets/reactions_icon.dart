import 'package:flutter/material.dart';

class ReactionsIcon extends StatefulWidget {
  final Color backColor;
  final IconData icon;
  const ReactionsIcon({super.key, required this.backColor, required this.icon});

  @override
  State<ReactionsIcon> createState() => _reactionsIconState();
}

class _reactionsIconState extends State<ReactionsIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.backColor,
          border: Border.all(color: Colors.white, width: 3)),
      width: 28,
      height: 28,
      child: Icon(
        widget.icon,
        color: Colors.white,
        size: 13,
      ),
    );
  }
}
