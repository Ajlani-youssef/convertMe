import 'package:convert_me/data.dart';
import 'package:convert_me/models/conversion.dart';
import 'package:convert_me/services/auth_service.dart';
import 'package:convert_me/services/forex_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeViewModel extends ChangeNotifier {
  final AuthService _authService = GetIt.instance<AuthService>();

  final ForexApiService _forexApiService = GetIt.instance<ForexApiService>();

  late String from;
  late String to;
  double ammount = 0;
  TextEditingController input = TextEditingController();
  TextEditingController output = TextEditingController();

  HomeViewModel() {
    init();
    getAmmount();
  }

  @override
  void dispose() {
    input.dispose();
    output.dispose();
    super.dispose();
  }

  void init() {
    from = _authService.user!.from;
    to = _authService.user!.to;
    input.addListener(() {
      convert();
    });
    notifyListeners();
  }

  void updateUser() {
    from = _authService.user!.from;
    to = _authService.user!.to;
    notifyListeners();
  }

  Future getAmmount() async {
    ammount = (await _forexApiService.getCurrencyValue(from, to))!;
    notifyListeners();
  }

  void convert() async {
    if (input.text.isEmpty) {
      output.clear();
    } else {
      output.text = (double.parse(input.text) * ammount).toString();
    }
    notifyListeners();
  }

  void swipe() async {
    ammount = 1 / ammount;
    String inter = to;
    to = from;
    from = inter;
    inter = input.text;
    input.text = output.text;
    output.text = inter;
    notifyListeners();
  }

  void discardConversion() async {
    input.clear();
    output.clear();
    notifyListeners();
  }

  Future saveConversion() async {
    dummyConversions.add(
      Conversion(
        from: from,
        to: to,
        date: DateTime.now(),
        ammount: double.parse(input.text),
        result: double.parse(output.text),
      ),
    );
    discardConversion();
  }
}
