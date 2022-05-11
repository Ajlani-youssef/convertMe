import 'package:convert_me/config.dart';
import 'package:convert_me/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../archive/archive_screen.dart';
import '../settings/settings_screen.dart';

AppBar customAppBar(String routeName) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: GestureDetector(
      onTap: () {
        if (routeName != HomeScreen.routeName) {
          Navigator.of(Config.navigatorKey.currentContext!).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          if (routeName != ArchiveScreen.routeName) {
            Navigator.of(Config.navigatorKey.currentContext!).pushReplacementNamed(ArchiveScreen.routeName);
          }
        },
        child: const Icon(
          Icons.archive,
          color: Colors.black,
        ),
      ),
      const SizedBox(width: 15),
      GestureDetector(
        onTap: () {
          Navigator.of(Config.navigatorKey.currentContext!).push(
            PageRouteBuilder(
              opaque: false, // set to false
              pageBuilder: (_, __, ___) => const SettignsScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.settings,
          color: Colors.black,
        ),
      ),
      const SizedBox(width: 15),
    ],
  );
}
