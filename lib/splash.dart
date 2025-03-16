import 'package:blogclub/onboarding.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:blogclub/gen/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((onValue) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Assets.img.background.splash.image()),
          Center(child: Assets.img.icons.logo.image(width: 162, height: 81)),
        ],
      ),
    );
  }
}
