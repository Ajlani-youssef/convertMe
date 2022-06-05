import 'package:convert_me/data.dart';
import 'package:convert_me/models/currency.dart';
import 'package:convert_me/models/user.dart';
import 'package:convert_me/services/auth_service.dart';
import 'package:convert_me/services/forex_api_service.dart';
import 'package:convert_me/viewmodels/home_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_viewmodel_test.mocks.dart';

@GenerateMocks([
  AuthService,
  ForexApiService,
])
void main() {
  late HomeViewModel homeViewModel;
  User? currentUser;
  double value = 3.01;
  setUpAll(() async {
    currentUser = User(
      username: "youssef",
      from: "EUR",
      to: "TND",
    );
    final authService = MockAuthService();
    final forexApiService = MockForexApiService();

    when(authService.init()).thenAnswer((realInvocation) async {});

    when(authService.user).thenAnswer((realInvocation) {
      return currentUser;
    });

    when(forexApiService.getCurrencyValue(any, any)).thenAnswer((realInvocation) async {
      return value;
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

    homeViewModel = HomeViewModel();
  });
  group('Testing Home View Model', () {
    test('init', () {
      homeViewModel.init();
      expect(homeViewModel.from, "EUR");
      expect(homeViewModel.to, "TND");
      expect(homeViewModel.input.hasListeners, true);
    });

    test('update User', () {
      currentUser = User(
        username: "youssef",
        from: "TND",
        to: "EUR",
      );
      homeViewModel.updateUser();
      expect(homeViewModel.to, "EUR");
      expect(homeViewModel.from, "TND");
    });

    test('get Ammount', () {
      homeViewModel.getAmmount();
      expect(homeViewModel.ammount, value);
    });

    test('Convert empty input', () {
      homeViewModel.input.text = "";
      homeViewModel.convert();
      expect(homeViewModel.output.text, "");
    });

    test('Convert', () {
      double input = 2.5;
      homeViewModel.input.text = input.toString();
      double expected = 2.5 * value;
      homeViewModel.convert();
      expect(homeViewModel.output.text, expected.toString());
    });

    test('Swipe', () {
      double input = 2.5;
      homeViewModel.input.text = input.toString();
      double expected = 2.5 * value;
      homeViewModel.swipe();
      expect(homeViewModel.output.text, input.toString());
      expect(homeViewModel.input.text, expected.toString());
      expect(homeViewModel.ammount, 1 / value);
    });

    test('Discard Conversion', () {
      double input = 2.5;
      homeViewModel.input.text = input.toString();
      homeViewModel.discardConversion();
      expect(homeViewModel.output.text, "");
      expect(homeViewModel.input.text, "");
    });

    test('save conversion', () {
      double input = 2.5;
      int length = dummyConversions.length;
      homeViewModel.input.text = input.toString();
      homeViewModel.saveConversion();
      expect(homeViewModel.output.text, "");
      expect(homeViewModel.output.text, "");
      expect(dummyConversions.length, length + 1);
      expect(dummyConversions.last.ammount, input);
      expect(dummyConversions.last.result, input * (1 / value));
      expect(dummyConversions.last.from, "EUR");
      expect(dummyConversions.last.to, "TND");
    });
  });
}
