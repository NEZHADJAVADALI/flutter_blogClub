import 'package:blogclub/data.dart';
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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Avenir",
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final List<StoryData> stories = AppDatabase.stories;
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
              Padding(
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 10),
                child: Text(
                  "Explore today's",
                  style: themeData.headlineMedium!.copyWith(fontSize: 24),
                ),
              ),
              _ListView(screenWidth: screenWidth, stories: stories),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    super.key,
    required this.screenWidth,
    required this.stories,
  });

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
  const _Story({super.key, required this.story});

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
  _StoryViewed({super.key, required this.story});

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
                dashPattern: [6,3,9,3],
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
