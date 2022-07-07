import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiraqu/constant.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tiraqu/screens/leanding_screen.dart';
import 'package:tiraqu/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isOpenned = false;

  Future<void> _checkIfOpenned() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var isOpenned = _prefs.getString('opened');

    if (isOpenned != null) {
      setState(() {
        _isOpenned = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfOpenned();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/images/splash_screen.json',
            fit: BoxFit.contain,
          ),
          const Text(
            "TiraQu",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              color: kLightPrimaryColor,
            ),
          )
        ],
      ),
      nextScreen: _isOpenned ? LeandingScreen() : OnBoardingScreen(),
      splashIconSize: double.maxFinite,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: const Duration(milliseconds: 1700),
      // duration: 500,
    );
  }
}
