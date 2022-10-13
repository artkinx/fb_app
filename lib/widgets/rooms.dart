import 'package:fb_app/config/my_custom_scroll_behaviour.dart';
import 'package:fb_app/data/data.dart';
import 'package:fb_app/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class Rooms extends StatefulWidget {
  final List<User>? onlineUsers;
  const Rooms({Key? key, this.onlineUsers}) : super(key: key);

  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 6),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: _CreateRoomButton());
            }
            final User user = onlineUsers[index - 1];
            return ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(30)),
      child: TextButton.icon(
        onPressed: () => {},
        label: Text("Add\nRoom"),
        icon: Icon(Icons.video_call_sharp),
      ),
    );
  }
}
