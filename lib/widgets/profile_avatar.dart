import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

class ProfileAvatar extends StatefulWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;
  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Stack(children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: widget.hasBorder ? 13.0 : 16,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(widget.imageUrl),
          ),
        ),
        widget.isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.3)),
                ))
            : SizedBox.shrink()
      ]),
    );
  }
}
