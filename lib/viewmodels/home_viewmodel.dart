import 'package:convert_me/models/user.dart';
import 'package:flutter/material.dart';

class Home extends ChangeNotifier {
  User? user;
  double ammount = 0;
  TextEditingController input = TextEditingController();
  TextEditingController output = TextEditingController();

  Future<bool> getAmmount() async {
    // TODO: get amount from service 
    return true;
  }

  void convert() async {
    // TODO: update output
  }

  void discardConversion() async {
    // TODO: update output
  }

  Future<bool> saveConversion() async {
    // TODO: save convertion informations
    return true;
  }

}
