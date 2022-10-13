import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  late Function onPressed = () => {};

  CircleButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: IconButton(
        splashRadius: 23,
        icon: Icon(icon),
        iconSize: iconSize,
        color: iconColor,
        onPressed: () => onPressed,
      ),
    );
  }
}
