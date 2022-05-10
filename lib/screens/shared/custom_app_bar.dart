import 'package:flutter/material.dart';

AppBar CustomAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/logo.png"),
          fit: BoxFit.fill,
        ),
      ),
    ),
    actions: [
      Icon(
        Icons.archive,
        color: Colors.black,
      ),
      SizedBox(width: 15),
      Icon(
        Icons.settings,
        color: Colors.black,
      ),
      SizedBox(width: 15),
    ],
  );
}
