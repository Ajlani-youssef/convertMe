import 'package:convert_me/screens/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/currency.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../viewmodels/user_viewmodel.dart';
import '../shared/input.dart';

class SettignsScreen extends StatelessWidget {
  static String routeName = '/settings';
  const SettignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            color: Colors.black.withOpacity(0.7),
            width: deviceWidth,
            height: deviceHeight,
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(deviceWidth * 0.08)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(0.0, 1.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  height: deviceHeight * 0.6,
                  width: deviceWidth * 0.8,
                  child: Consumer<UserViewModel>(
                    builder: (context, userViewModel, child) {
                      return Column(
                        children: [
                          SizedBox(
                            height: deviceHeight * 0.1,
                          ),
                          CustomInput(
                            controller: userViewModel.usernameUpdate,
                            hintText: "User name",
                          ),
                          SizedBox(
                            height: deviceHeight * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownButton(
                                // Initial Value
                                value: userViewModel.fromUpdate,

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
                                    userViewModel.setFromUpdate(newValue);
                                  }
                                },
                              ),
                              SizedBox(
                                width: deviceWidth * 0.15,
                              ),
                              const Icon(Icons.currency_exchange),
                              SizedBox(
                                width: deviceWidth * 0.15,
                              ),
                              DropdownButton(
                                // Initial Value
                                value: userViewModel.toUpdate,

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
                                    userViewModel.setToUpdate(newValue);
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: deviceHeight * 0.13,
                          ),
                          CustomButton(
                            active: userViewModel.usernameUpdate.text.isNotEmpty,
                            callback: () {
                              userViewModel.updateUser();
                              Provider.of<HomeViewModel>(context, listen: false).updateUser();
                            },
                            text: "Confirm",
                            icon: Icons.check,
                            color: Colors.green,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
