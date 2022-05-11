import 'package:convert_me/config.dart';
import 'package:convert_me/screens/archive/archive_screen.dart';
import 'package:convert_me/screens/home/home_screen.dart';
import 'package:convert_me/screens/settings/settings_screen.dart';
import 'package:convert_me/screens/signup/signup_screen.dart';
import 'package:convert_me/screens/splashScreen/splash_screen.dart';
import 'package:convert_me/services/auth_service.dart';
import 'package:convert_me/services/forex_api_service.dart';
import 'package:convert_me/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();
  runApp(const MyApp());
}

Future<void> setupServices() async {
  final getIt = GetIt.instance;
  getIt.registerSingletonAsync<AuthService>(
    () async {
      final authService = AuthService();
      await authService.init();
      return authService;
    },
  );
  getIt.registerSingleton<ForexApiService>(ForexApiService());

  await getIt.allReady();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Convert Me',
        navigatorKey: Config.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ArchiveScreen.routeName: (context) => const ArchiveScreen(),
          SettignsScreen.routeName: (context) => const SettignsScreen(),
          SignupScreen.routeName: (context) => const SignupScreen(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
