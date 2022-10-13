import 'package:fb_app/config/palette.dart';
import 'package:fb_app/data/data.dart';
import 'package:fb_app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class CreatePostContainer extends StatefulWidget {
  final User? currentUser;
  const CreatePostContainer({
    Key? key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  State<CreatePostContainer> createState() => createPostContainerState();
}

class createPostContainerState extends State<CreatePostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?"),
                ),
              ),
              TextButton(
                child: Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
                onPressed: () => print("photo Library"),
              )
            ],
          ),
          Divider(height: 10.0, thickness: 0.5),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text(
                    "Live",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.photo_library,
                    color: Palette.facebookBlue,
                  ),
                  label: const Text(
                    "Photos",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text(
                    "Room",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                VerticalDivider(
                  width: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
