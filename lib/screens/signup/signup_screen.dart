import 'package:convert_me/screens/shared/custom_button.dart';
import 'package:convert_me/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../models/currency.dart';
import '../home/home_screen.dart';
import '../shared/input.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceHeight * 0.15,
                  ),
                  Container(
                    height: deviceHeight * 0.2,
                    width: deviceHeight * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  CustomInput(
                    controller: userViewModel.usernameSignup,
                    hintText: "User name",
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        key: const Key("dropDown1"),
                        // Initial Value
                        value: userViewModel.fromSignup,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: userViewModel.fromCurrencies.map((Currency items) {
                          return DropdownMenuItem(
                            value: items.code,
                            child: Text(items.code),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            userViewModel.setFromSignUp(newValue);
                          }
                        },
                      ),
                      SizedBox(
                        width: deviceWidth * 0.15,
                      ),
                      Icon(Icons.currency_exchange),
                      SizedBox(
                        width: deviceWidth * 0.15,
                      ),
                      DropdownButton(
                        key: const Key("dropDown2"),

                        // Initial Value
                        value: userViewModel.toSignup,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: userViewModel.toCurrencies.map((Currency items) {
                          return DropdownMenuItem(
                            value: items.code,
                            child: Text(items.code),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            userViewModel.setToSignUp(newValue);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.2,
                  ),
                  CustomButton(
                    callback: () async {
                      if (await userViewModel.signUp()) {
                        Navigator.of(Config.navigatorKey.currentContext!)
                            .pushNamedAndRemoveUntil(HomeScreen.routeName, (Route<dynamic> route) => false);
                      }
                    },
                    active: userViewModel.activeSignUp(),
                    text: "Sign in",
                    icon: Icons.person,
                    color: Colors.green,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
