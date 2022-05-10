import 'package:convert_me/config.dart';
import 'package:convert_me/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../archive/archive_screen.dart';
import '../settings/settings_screen.dart';

AppBar CustomAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: GestureDetector(
      onTap: () {
        print(ModalRoute.of(Config.navigatorKey.currentContext!));
        if (ModalRoute.of(Config.navigatorKey.currentContext!)?.settings.name == HomeScreen.routeName) {
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
          if (ModalRoute.of(Config.navigatorKey.currentContext!)?.settings.name == ArchiveScreen.routeName) {
            Navigator.of(Config.navigatorKey.currentContext!).pushReplacementNamed(ArchiveScreen.routeName);
          }
        },
        child: Icon(
          Icons.archive,
          color: Colors.black,
        ),
      ),
      SizedBox(width: 15),
      GestureDetector(
        onTap: () {
          Navigator.of(Config.navigatorKey.currentContext!).push(
            PageRouteBuilder(
              opaque: false, // set to false
              pageBuilder: (_, __, ___) => const SettignsScreen(),
            ),
          );
          ;
        },
        child: Icon(
          Icons.settings,
          color: Colors.black,
        ),
      ),
      SizedBox(width: 15),
    ],
  );
}
