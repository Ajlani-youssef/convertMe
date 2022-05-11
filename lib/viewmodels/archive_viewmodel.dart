import 'dart:async';

import 'package:convert_me/data.dart';
import 'package:flutter/material.dart';

import '../models/conversion.dart';

class ArchiveViewModel extends ChangeNotifier {
  List<Conversion> conversions = [];

  Future getConversions() async {
    // TODO: get Conversions from sqflite
    conversions = dummyConversions;
    notifyListeners();
  }

  Future updateConversations() async {
    // TODO: add Conversions to sqflite
    conversions = dummyConversions;
    notifyListeners();
  }
}
