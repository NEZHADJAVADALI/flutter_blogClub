import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'main.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<StoryData> stories = AppDatabase.stories;
  final categories = AppDatabase.categories;
  final posts = AppDatabase.posts;
  @override
  Widget build(BuildContext context) {
    final TextTheme themeData = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(),
              _Title(themeData: themeData),
              _ListView(screenWidth: screenWidth, stories: stories),
              _CategoryCarousel(categories: categories, themeData: themeData),
              _PostHeader(),
              PostList(posts: posts),
            ],
          ),
        ),
      ),
    );
  }
}


class PostList extends StatelessWidget {
  const PostList({super.key, required this.posts});

  final List<PostData> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    itemCount: posts.length,
    shrinkWrap: true,
    itemExtent: 141,
    itemBuilder: (context, index) {
      final post = posts[index];
      return Padding(
        padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
        child: Container(
          height: 141,
          width: 343,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 1,
                color: Color.fromARGB(25, 0, 0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  "assets/img/posts/small/${post.imageFileName}",
                  height: 141,
                  width: 100,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.caption,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(post.title),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.hand_thumbsup, size: 15),
                          const SizedBox(width: 8),
                          Text(post.likes, style: TextStyle(fontSize: 12)),
                          const SizedBox(width: 20),
                          Icon(CupertinoIcons.clock, size: 15),
                          Text(post.time),
                          const SizedBox(width: 20),
                          post.isBookmarked
                              ? Icon(
                            CupertinoIcons.bookmark_fill,
                            size: 15,
                            color: MyApp.primarySchemeColor,
                          )
                              : Icon(
                            CupertinoIcons.bookmark,
                            size: 15,
                            color: MyApp.primarySchemeColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
        );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Latest News", style: Theme.of(context).textTheme.labelSmall),
          TextButton(onPressed: () {}, child: Text("More")),
        ],
      ),
    );
  }
}


class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hi, Jonathan!"),
          Image.asset(
            "assets/img/icons/notification.png",
            width: 35,
            height: 35,
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.themeData});

  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 10),
      child: Text(
        "Explore today's",
        style: themeData.headlineMedium!.copyWith(fontSize: 24),
      ),
    );
  }
}

class _CategoryCarousel extends StatelessWidget {
  const _CategoryCarousel({required this.categories, required this.themeData});

  final List<Category> categories;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        final category = categories[realIndex];
        return _CategoryItem(
          category: category,
          themeData: themeData,
          left: realIndex == 0 ? 32 : 8,
          right: realIndex == categories.length - 1 ? 32 : 8,
        );
      },
      options: CarouselOptions(
        padEnds: false,
        scrollDirection: Axis.horizontal,
        aspectRatio: 1.2,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        autoPlay: false,
        enlargeFactor: 0.4,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final double left;
  final double right;
  const _CategoryItem({
    required this.category,
    required this.themeData,
    required this.left,
    required this.right,
  });

  final Category category;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: right, left: left),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            bottom: 35,
            left: 40,
            right: 40,
            top: 100,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: Color.fromARGB(90, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Container(
              decoration: BoxDecoration(),
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Color(0xff0D253C), Color(0x1A0D253C)],
                ),
              ),
              child: Image.asset(
                "assets/img/posts/large/${category.imageFileName}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            top: 270,
            left: 30,
            child: Text(category.title, style: themeData.labelMedium),
          ),
        ],
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({required this.screenWidth, required this.stories});

  final double screenWidth;
  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 0, 10),
      child: SizedBox(
        height: 110,
        width: screenWidth,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return story.isViewed
                ? _StoryViewed(story: story)
                : _Story(story: story);
          },
        ),
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({required this.story});

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff376AED),
                        Color(0xff49B0E2),
                        Color(0xff9CECFB),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(21),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              "assets/img/stories/${story.imageFileName}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/img/icons/${story.iconFileName}",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(story.name),
        ],
      ),
    );
  }
}

class _StoryViewed extends StatelessWidget {
  const _StoryViewed({required this.story});

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      child: Column(
        children: [
          Stack(
            children: [
              DottedBorder(
                color: Colors.black,
                strokeWidth: 2,
                dashPattern: [6, 3, 9, 3],
                borderType: BorderType.RRect,
                radius: Radius.circular(24),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: Container(
                      height: 62,
                      width: 62,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            "assets/img/stories/${story.imageFileName}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/img/icons/${story.iconFileName}",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(story.name),
        ],
      ),
    );
  }
}