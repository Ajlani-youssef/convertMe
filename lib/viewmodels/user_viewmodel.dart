import 'package:convert_me/models/user.dart';
import 'package:convert_me/services/auth_service.dart';
import 'package:convert_me/services/forex_api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/currency.dart';

class UserViewModel extends ChangeNotifier {
  final AuthService _authService = GetIt.instance<AuthService>();

  final ForexApiService _forexApiService = GetIt.instance<ForexApiService>();

  User? _user;

  bool signedIn = false;

  TextEditingController usernameSignup = TextEditingController();

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

  setToSignUp(String code) {
    toSignup = code;
    fromCurrencies = _currencies.where((currency) => currency.code != code).toList();

    notifyListeners();
  }

  Future<bool> signUp() async {
    if (!activeSignUp()) {
      return false;
    }
    bool signedUp = await _authService.signup(usernameSignup.text, toSignup!, fromSignup!);
    if (signedUp) {
      _user = user;
      signedIn = true;
    }
    return signedUp;
  }

  Future<bool> updateUser(User user) async {
    // TODO: update user information in shared preferences
    return true;
  }

  bool activeSignUp() {
    return !(usernameSignup.text.isEmpty || toSignup == null || fromSignup == null);
  }
}
