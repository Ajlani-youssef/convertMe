import 'package:convert_me/screens/shared/custom_button.dart';
import 'package:flutter/material.dart';

import '../shared/input.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("USD"),
                  SizedBox(
                    width: deviceWidth * 0.15,
                  ),
                  Icon(Icons.currency_exchange),
                  SizedBox(
                    width: deviceWidth * 0.15,
                  ),
                  Text("TND"),
                ],
              ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              CustomInput(),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              CustomInput(),
              SizedBox(
                height: deviceHeight * 0.22,
              ),
              CustomButton(
                text: "Save",
                icon: Icons.save,
                color: Colors.green,
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              CustomButton(
                text: "Discard",
                icon: Icons.delete,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
