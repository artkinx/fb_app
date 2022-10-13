import 'package:fb_app/config/my_custom_scroll_behaviour.dart';
import 'package:fb_app/config/my_ticker_provider.dart';
import 'package:flutter/material.dart';
import 'package:fb_app/config/palette.dart';
import 'package:fb_app/data/data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fb_app/widgets/widgets.dart';

import '../models/models.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => homeScreenNewState();
}

class homeScreenNewState extends State<HomeScreenNew>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              bottom: _selectedIndex > 0
                  ? null
                  : TabBar(
                      onTap: (selected) {
                        _selectedIndex = selected;
                        setState(() {});
                      },
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.home_outlined,
                            color: Colors.grey[600],
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            color: Colors.grey[600],
                            Icons.video_stable_outlined,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.local_mall_outlined,
                            color: Colors.grey[600],
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            MdiIcons.bellOutline,
                            color: Colors.grey[600],
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                      controller: controller,
                    ),
              elevation: 2,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              title: _selectedIndex > 0
                  ? TabBar(
                      onTap: (selected) {
                        _selectedIndex = selected;
                        setState(() {});
                      },
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.home_outlined,
                            color: Colors.grey[600],
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            color: Colors.grey[600],
                            Icons.video_stable_outlined,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.local_mall_outlined,
                            color: Colors.grey[600],
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            MdiIcons.bellOutline,
                            color: Colors.grey[600],
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                      controller: controller,
                    )
                  : Text(
                      "facebook",
                      style: const TextStyle(
                        color: Palette.facebookBlue,
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.2,
                      ),
                    ),
              floating: true,
              snap: true,
              forceElevated: true,
              centerTitle: false,
              actions: _selectedIndex > 0
                  ? null
                  : [
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
            SliverFillRemaining(
              child: IndexedStack(
                index: _selectedIndex,
                alignment: Alignment.center,
                children: [
                  ListView.builder(
                    itemCount: posts.length + 2,
                    itemBuilder: ((context, index) {
                      if (index == 0) {
                        return CreatePostContainerNew(currentUser: currentUser);
                      } else if (index == 1) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 5, 0, 5),
                          child: Stories(
                            currentUser: currentUser,
                            stories: stories,
                          ),
                        );
                      }
                      final Post post = posts[index - 2];
                      return PostContainer(
                        post: post,
                      );
                    }),
                  ),
                  Icon(Icons.search),
                  Icon(Icons.abc_outlined),
                  Icon(Icons.home),
                  Icon(Icons.home),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
