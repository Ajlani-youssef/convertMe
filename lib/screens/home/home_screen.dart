import 'package:convert_me/screens/shared/custom_button.dart';
import 'package:convert_me/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/archive_viewmodel.dart';
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
        appBar: customAppBar(HomeScreen.routeName),
        extendBodyBehindAppBar: true,
        body: Consumer<HomeViewModel>(
          builder: (context, homeViewModel, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceHeight * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(homeViewModel.from),
                      SizedBox(
                        width: deviceWidth * 0.15,
                      ),
                      GestureDetector(
                        onTap: () {
                          homeViewModel.swipe();
                        },
                        child: const Icon(Icons.currency_exchange),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.15,
                      ),
                      Text(homeViewModel.to),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  CustomInput(
                    controller: homeViewModel.input,
                    hintText: "input",
                    type: TextInputType.number,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  CustomInput(
                    controller: homeViewModel.output,
                    hintText: "output",
                    readOnly: true,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.22,
                  ),
                  CustomButton(
                    callback: () {
                      homeViewModel.saveConversion();
                      Provider.of<ArchiveViewModel>(context, listen: false).updateConversations();
                    },
                    text: "Save",
                    icon: Icons.save,
                    color: Colors.green,
                    active: homeViewModel.input.text.isNotEmpty,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  CustomButton(
                    callback: homeViewModel.discardConversion,
                    text: "Discard",
                    icon: Icons.delete,
                    color: Colors.red,
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
