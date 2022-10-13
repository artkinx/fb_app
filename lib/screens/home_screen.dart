import 'package:fb_app/config/my_custom_scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:fb_app/config/palette.dart';
import 'package:fb_app/data/data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fb_app/widgets/widgets.dart';

import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                "facebook",
                style: const TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              floating: true,
              forceElevated: true,
              centerTitle: false,
              actions: [
                CircleButton(
                  icon: Icons.add,
                  iconColor: Colors.black,
                  iconSize: 24.0,
                  onPressed: () => print("Add"),
                ),
                CircleButton(
                  icon: Icons.search,
                  iconColor: Colors.black,
                  iconSize: 24.0,
                  onPressed: () => print("Search"),
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconColor: Colors.black,
                  iconSize: 24.0,
                  onPressed: () => print("Messenger"),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser),
            ),
            // SliverPadding(
            //   padding: EdgeInsets.fromLTRB(0.0, 10, 0, 5),
            //   sliver: SliverToBoxAdapter(
            //     child: Rooms(onlineUsers: onlineUsers),
            //   ),
            // ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0.0, 5, 0, 5),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return PostContainer(
                post: post,
              );
            }, childCount: posts.length))
          ],
        ),
      ),
    );
  }
}
