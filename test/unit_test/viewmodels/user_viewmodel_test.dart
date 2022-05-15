import 'package:convert_me/models/currency.dart';
import 'package:convert_me/models/user.dart';
import 'package:convert_me/services/auth_service.dart';
import 'package:convert_me/services/forex_api_service.dart';
import 'package:convert_me/viewmodels/user_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../data.dart';
import 'user_viewmodel_test.mocks.dart';

@GenerateMocks([
  AuthService,
  ForexApiService,
])
void main() {
  late UserViewModel userViewModel;
  User? currentUser;
  setUpAll(() async {
    final authService = MockAuthService();
    final forexApiService = MockForexApiService();

    when(authService.init()).thenAnswer((realInvocation) async {});

    when(authService.user).thenAnswer((realInvocation) {
      return currentUser;
    });

    when(authService.signup(any, any, any)).thenAnswer((realInvocation) async {
      currentUser = User(
        username: realInvocation.positionalArguments[0].toString(),
        from: realInvocation.positionalArguments[1].toString(),
        to: realInvocation.positionalArguments[2].toString(),
      );
      return true;
    });

    when(authService.update(any)).thenAnswer((realInvocation) async {
      currentUser = realInvocation.positionalArguments[0];
      return true;
    });

    when(forexApiService.getCurrencies()).thenAnswer((realInvocation) async {
      List<Currency> currencies = [];

      for (String code in dummyCurrencies.keys) {
        currencies.add(Currency(code: code, name: dummyCurrencies[code]!));
      }

      return currencies;
    });

    final getIt = GetIt.instance;
    getIt.registerSingletonAsync<AuthService>(
      () async {
        await authService.init();
        return authService;
      },
    );
    getIt.registerSingleton<ForexApiService>(forexApiService);

    await getIt.allReady();

    userViewModel = UserViewModel();
  });
  group('Testing User View Model Provider', () {
    test('setUser', () {
      User user = User(username: "youssef", from: "AFN", to: "TRY");
      userViewModel.setUser(user);
      expect(userViewModel.fromUpdate, user.from);
      expect(userViewModel.toUpdate, user.to);
      expect(userViewModel.usernameUpdate.text, user.username);
    });
    test('Change "from" Value from sign up page', () {
      String from = "AED";
      userViewModel.setFromSignUp(from);
      expect(userViewModel.fromSignup, from);
      expect(userViewModel.toCurrencies.any((element) => element.code == from), false);
    });
    test('Change "from" Value from update page', () {
      String from = "ALL";
      userViewModel.setFromUpdate(from);
      expect(userViewModel.fromUpdate, from);
      expect(userViewModel.toCurrencies.any((element) => element.code == from), false);
    });

    test('Change "to" Value from sign up page', () {
      String to = "AUD";
      userViewModel.setToSignUp(to);
      expect(userViewModel.toSignup, to);
      expect(userViewModel.fromCurrencies.any((element) => element.code == to), false);
    });

    test('Change "to" Value from update page', () {
      String to = "AMD";
      userViewModel.setToUpdate(to);
      expect(userViewModel.toUpdate, to);
      expect(userViewModel.fromCurrencies.any((element) => element.code == to), false);
    });

    test('Sign up with empty user name', () async {
      userViewModel.usernameSignup.text = "";
      bool signup = await userViewModel.signUp();
      expect(signup, false);
    });

    test('Sign up', () async {
      userViewModel.usernameSignup.text = "youssef";
      bool signup = await userViewModel.signUp();

      expect(currentUser!.from, "AED");
      expect(currentUser!.to, "AUD");
      expect(currentUser!.username, "youssef");
      expect(signup, true);
    });

    test('update user with emty user name', () async {
      userViewModel.usernameUpdate.text = "";
      userViewModel.toUpdate = "TND";
      userViewModel.fromUpdate = "USD";

      await userViewModel.updateUser();

      expect(currentUser!.from, "AED");
      expect(currentUser!.to, "AUD");
      expect(currentUser!.username, "youssef");
    });

    test('Update user', () async {
      userViewModel.usernameUpdate.text = "youssef 22";
      userViewModel.toUpdate = "TND";
      userViewModel.fromUpdate = "USD";
      await userViewModel.updateUser();

      expect(currentUser!.from, "USD");
      expect(currentUser!.to, "TND");
      expect(currentUser!.username, "youssef 22");
    });
  });
}
