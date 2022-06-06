import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/currency.dart';

class ForexApiService {
  Uri getUri(String route, {String? queryString}) {
    return Uri.parse(
        'https://api.fastforex.io/$route?${queryString != null ? "$queryString&" : ""}api_key=d27116f420-910498c499-rd10k2');
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

  Future<double?> getCurrencyValue(String from, String to) async {
    var client = http.Client();
    try {
      var response = await client.get(getUri('/fetch-one', queryString: "from=$from&to=$to"));
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return decodedResponse['result'][to];
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
