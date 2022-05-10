import 'package:flutter/material.dart';

import '../models/conversion.dart';

class Home extends ChangeNotifier {
  List<Conversion>? conversions;

  Future<bool> getConversions() async {
    // TODO: get Conversions from sqflite
    return true;
  }
}
