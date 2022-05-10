import 'package:convert_me/config.dart';
import 'package:convert_me/screens/archive/archive_screen.dart';
import 'package:convert_me/screens/home/home_screen.dart';
import 'package:convert_me/screens/settings/settings_screen.dart';
import 'package:convert_me/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convert Me',
      navigatorKey: Config.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SettignsScreen(),
    );
  }
}
