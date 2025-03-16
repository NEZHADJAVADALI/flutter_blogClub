import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final onBoardData = AppDatabase.onboards;

  int _currentPage = 0;

    @override
  void initState() {
      super.initState();

      _pageController.addListener(() {
        if (_currentPage != _pageController.page!.round()) {
          setState(() {
            _currentPage = _pageController.page!.round();
            debugPrint("onboarding page $_currentPage");
          });
        }
      }
      );}

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
              child: Assets.img.background.onboarding.image(),
            ),
          ),
          Container(
            height: 324,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 40)],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final onboard = onBoardData[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(onboard.title,style: themeData.textTheme.titleMedium),
                            Text(onboard.caption,style:themeData.textTheme.bodyMedium,),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: ExpandingDotsEffect(dotHeight: 8, dotWidth: 8),
                      ),
                      ElevatedButton(
                        child: _currentPage == onBoardData.length -1?Icon(CupertinoIcons.check_mark) :Icon(CupertinoIcons.arrow_right),
                        onPressed: () {
                          if (_currentPage != onBoardData.length-1){
                            _pageController.animateToPage(_currentPage+1, duration: Duration(microseconds: 500), curve: Curves.bounceInOut);
                          }else{
                            Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context){return MyHomePage();}),);}})
    ]),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
