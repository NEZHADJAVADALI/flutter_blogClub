import 'package:blogclub/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _ThemeConfig.theme(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<StoryData> stories = AppDatabase.stories;
  final categories = AppDatabase.categories;
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
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeConfig {
  static ThemeData theme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w700,
          fontFamily: "Avener",
        ),
        headlineMedium: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "Avenir",
        ),
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
        enlargeFactor: 0.3,
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
      padding: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
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
            top: 240,
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
          SizedBox(height: 2),
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
          SizedBox(height: 2),
          Text(story.name),
        ],
      ),
    );
  }
}
