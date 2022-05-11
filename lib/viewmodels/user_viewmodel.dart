import 'package:convert_me/models/user.dart';
import 'package:convert_me/services/auth_service.dart';
import 'package:convert_me/services/forex_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../config.dart';
import '../models/currency.dart';

class UserViewModel extends ChangeNotifier {
  final AuthService _authService = GetIt.instance<AuthService>();

  final ForexApiService _forexApiService = GetIt.instance<ForexApiService>();

  User? _user;

  bool signedIn = false;

  TextEditingController usernameSignup = TextEditingController();

  TextEditingController usernameUpdate = TextEditingController();

  late String fromUpdate;
  late String toUpdate;

  String? fromSignup;
  String? toSignup;

  List<Currency> _currencies = [];
  List<Currency> fromCurrencies = [];
  List<Currency> toCurrencies = [];

  User? get user => _user;

  UserViewModel() {
    setUser(_authService.user);
    getCurrencies();
  }

  @override
  void dispose() {
    usernameSignup.dispose();
    super.dispose();
  }

  void setUser(User? user) {
    _user = user;
    if (user != null) {
      fromUpdate = user.from;
      toUpdate = user.to;
      usernameUpdate.text = user.username;
      signedIn = true;
    }
    notifyListeners();
  }

  Future getCurrencies() async {
    _currencies = await _forexApiService.getCurrencies();
    fromCurrencies = _currencies;
    toCurrencies = _currencies;
    notifyListeners();
  }

  setFromSignUp(String code) {
    fromSignup = code;
    toCurrencies = _currencies.where((currency) => currency.code != code).toList();
    notifyListeners();
  }

  setFromUpdate(String code) {
    fromUpdate = code;
    toCurrencies = _currencies.where((currency) => currency.code != code).toList();
    notifyListeners();
  }

  setToSignUp(String code) {
    toSignup = code;
    fromCurrencies = _currencies.where((currency) => currency.code != code).toList();
    notifyListeners();
  }

  setToUpdate(String code) {
    toUpdate = code;
    fromCurrencies = _currencies.where((currency) => currency.code != code).toList();
    notifyListeners();
  }

  Future<bool> signUp() async {
    if (!activeSignUp()) {
      return false;
    }
    bool signedUp = await _authService.signup(usernameSignup.text, toSignup!, fromSignup!);
    fromUpdate = fromSignup!;
    toUpdate = toSignup!;
    usernameUpdate.text = usernameSignup.text;
    if (signedUp) {
      _user = user;
      signedIn = true;
    }
    return signedUp;
  }

  Future<bool> updateUser() async {
    if (usernameUpdate.text.isNotEmpty) {
      user!.from = fromUpdate;
      user!.to = toUpdate;
      user!.username = usernameUpdate.text;
      _authService.update(user!);
    }
    notifyListeners();
    Navigator.of(Config.navigatorKey.currentContext!).pop();
    return true;
  }

  bool activeSignUp() {
    return !(usernameSignup.text.isEmpty || toSignup == null || fromSignup == null);
  }
}
