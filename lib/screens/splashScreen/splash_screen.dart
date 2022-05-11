import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../config.dart';
import '../../services/auth_service.dart';
import '../home/home_screen.dart';
import '../signup/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = GetIt.instance<AuthService>();

  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          height: deviceHeight * 0.2,
          width: deviceHeight * 0.2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  void navigationToNextPage() {
    if (_authService.loggedIn == true) {
      Navigator.of(Config.navigatorKey.currentContext!)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (Route<dynamic> route) => false);
    } else {
      Navigator.of(Config.navigatorKey.currentContext!)
          .pushNamedAndRemoveUntil(SignupScreen.routeName, (Route<dynamic> route) => false);
    }
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationToNextPage);
  }
}
