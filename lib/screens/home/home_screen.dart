import 'package:convert_me/screens/shared/custom_button.dart';
import 'package:flutter/material.dart';

import '../shared/custom_app_bar.dart';
import '../shared/input.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        extendBodyBehindAppBar: true,
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
