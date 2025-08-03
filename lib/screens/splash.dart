import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgo/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => const Home()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.1,
              0.15,
              0.23,
              1.0,
            ], // Adjust these values to control color transitions
            colors: [
              Colors.white.withOpacity(0.9), // Light at top
              const Color(0xFFFFF0F0), // Very light pink
              const Color(0xFFF8C3C3), // Medium pink
              const Color(0xFFEF2A39), // Strong red at bottom
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 360,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/Foodgo.svg", height: 110),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 670, left: 5),
              child: Positioned(
                bottom: 2,
                left: 3,
                right: 0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Image.asset('assets/spl1.png', height: 160),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Image.asset('assets/spl2.png', height: 160),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
