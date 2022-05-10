import 'package:convert_me/screens/shared/custom_button.dart';
import 'package:flutter/material.dart';

import '../shared/input.dart';

class SettignsScreen extends StatefulWidget {
  const SettignsScreen({Key? key}) : super(key: key);

  @override
  State<SettignsScreen> createState() => _SettignsScreenState();
}

class _SettignsScreenState extends State<SettignsScreen> {
  String dropdownvalue = 'USD';

  var items = [
    'USD',
    'TND',
  ];
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
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
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.1,
                ),
                CustomInput(
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
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
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
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.13,
                ),
                CustomButton(
                  text: "Confirm",
                  icon: Icons.check,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
