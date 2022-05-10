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
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Text(
              'Health Calorei',
              style: TextStyle(fontSize: 40, color: Colors.white.withOpacity(0.8)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120.0, top: 20),
            child: Text(
              'For healthy Life ..',
              style: TextStyle(fontSize: 18, color: Colors.white70.withOpacity(0.6)),
            ),
          )
        ]),
      ),
    ));
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
