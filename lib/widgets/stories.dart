import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_app/config/my_custom_scroll_behaviour.dart';
import 'package:fb_app/config/palette.dart';
import 'package:fb_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const Stories({
    super.key,
    required this.currentUser,
    required this.stories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          itemCount: stories.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(story: story),
            );
          },
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final Story? story;
  final User? currentUser;
  const _StoryCard(
      {super.key, this.story, this.currentUser, this.isAddStory = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.9,
          )
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
                imageUrl:
                    !isAddStory ? story!.imageUrl! : currentUser!.imageUrl,
                height: double.infinity,
                width: 110,
                fit: BoxFit.cover),
          ),
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
            left: 3,
            top: 8,
            child: isAddStory
                ? SizedBox.shrink()
                : ProfileAvatar(
                    imageUrl: story!.user!.imageUrl,
                    hasBorder: !story!.isViewed!,
                  ),
          ),
          isAddStory
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    width: 110,
                    height: 69,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          isAddStory
              ? Positioned(
                  bottom: 0,
                  top: 76,
                  left: 37,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.facebookBlue,
                        border: Border.all(
                            color: Colors.white,
                            width: 3,
                            strokeAlign: StrokeAlign.outside),
                        boxShadow: null),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 12,
                      splashColor: Colors.grey,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      iconSize: 28,
                      onPressed: () {},
                    ),
                  ))
              : SizedBox.shrink(),
          Positioned(
            bottom: 8,
            left: isAddStory ? 20 : 8,
            right: 8,
            child: Text(
              isAddStory ? "Add to Story" : story!.user!.name!,
              style: TextStyle(
                  color: isAddStory ? Colors.black : Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
