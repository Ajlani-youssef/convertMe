import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/currency.dart';

class ForexApiService {
  Uri getUri(String route) {
    return Uri.parse('https://api.fastforex.io/$route?api_key=aab3d1717c-c75dd2176f-rbo4fn');
  }

  Future<List<Currency>> getCurrencies() async {
    var client = http.Client();
    List<Currency> currencies = [];
    try {
      var response = await client.get(getUri('/currencies'));
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      Map<dynamic, dynamic> decodedCurrencies = decodedResponse['currencies'];
      for (String key in decodedCurrencies.keys) {
        currencies.add(Currency(code: key, name: decodedCurrencies[key]));
      }
      return currencies;
    } catch (e) {
      debugPrint("error fetching curencies");
      return [];
    }
  }
}
