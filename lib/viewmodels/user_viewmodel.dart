import 'package:convert_me/models/user.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  User? user;
  bool signedIn = false;

  Future<bool> signUp(User user) async {
    // TODO: save sign up information in shared preferences
    return true;
  }

  Future<bool> signIn() async {
    // TODO: get user information from shared preferences
    return true;
  }

  Future<bool> updateUser(User user) async {
    // TODO: update user information in shared preferences
    return true;
  }
}
