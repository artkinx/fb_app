import 'package:fb_app/data/data.dart';
import 'package:fb_app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/user_model.dart';

class CreatePostContainerNew extends StatefulWidget {
  final User? currentUser;
  const CreatePostContainerNew({
    Key? key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  State<CreatePostContainerNew> createState() => createPostContainerNewState();
}

class createPostContainerNewState extends State<CreatePostContainerNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 60,
              ),
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(11, 11, 0, 0),
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0.3,
                          color: Colors.grey[600] as Color,
                          blurStyle: BlurStyle.normal),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "What's on your mind?"),
                  ),
                ),
              ),
              TextButton(
                child: Icon(
                  Icons.photo_library_outlined,
                  color: Colors.green,
                ),
                onPressed: () => print("photo Library"),
              )
            ],
          ),
          const SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}
