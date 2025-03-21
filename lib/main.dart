import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:blogclub/theme.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/article.dart';
import 'package:blogclub/search.dart';
import 'package:blogclub/profile.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const primaryFontColor = Color.fromARGB(255, 0, 0, 0);
  static const primarySchemeColor = Color(0xff376AED);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeConfig.theme(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
   const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int homeIndex = 0;
int articleIndex = 1;
int searchIndex = 2;
int profileIndex = 3;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(bottom: 40, child: IndexedStack(
            index: selectedScreenIndex,
            children: [
              MyHomePage(),
              Article(),
              Search(),
              Profile(),  
            ],
          )),
          Positioned(left: 0, right: 0, bottom: 0, child: _ButtomNavigation(selectedScreenIndex: selectedScreenIndex)),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _ButtomNavigation extends StatefulWidget {
  final int selectedScreenIndex;
  final ValueChanged<int> onIndexChanged;

  _ButtomNavigation({
    Key? key,
    required this.selectedScreenIndex,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  State<_ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<_ButtomNavigation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 4,
                    color: Color(0xff000000).withAlpha(50),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 16, 32, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ButtomNavigationItem(
                      iconPath: 'assets/img/icons/Home.png',
                      title: 'Home',
                      titleColor: MyApp.primarySchemeColor,
                      onTap: () {
                        widget.onIndexChanged(homeIndex);
                      },
                    ),
                    _ButtomNavigationItem(
                      iconPath: 'assets/img/icons/Articles.png',
                      title: 'Articles',
                      titleColor: Color(0xff7B8BB2),
                      onTap: () {
                        widget.onIndexChanged(articleIndex);
                      },
                    ),
                    const SizedBox(width: 20),
                    _ButtomNavigationItem(
                      iconPath: 'assets/img/icons/Search.png',
                      title: 'Search',
                      titleColor: Color(0xff7B8BB2),
                      onTap: () {
                        widget.onIndexChanged(searchIndex);
                      },
                    ),
                    _ButtomNavigationItem(
                      iconPath: 'assets/img/icons/Menu.png',
                      title: 'Menu',
                      titleColor: Color(0xff7B8BB2),
                      onTap: () {
                        widget.onIndexChanged(profileIndex);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: Color(0xff376AED),
              borderRadius: BorderRadius.circular(32.5),
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Assets.img.icons.plus.image(),
          ),
        ],
      ),
    );
  }
}

class _ButtomNavigationItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color titleColor;
  final Function() onTap;

  const _ButtomNavigationItem({
    required this.iconPath,
    required this.title,
    required this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(iconPath),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.apply(color: titleColor),
          ),
        ],
      ),
    );
  }
}
