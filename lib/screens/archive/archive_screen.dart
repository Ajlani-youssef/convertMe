import 'package:convert_me/screens/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/input.dart';

class ArchiveSceren extends StatelessWidget {
  const ArchiveSceren({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SizedBox(
                height: deviceWidth * 0.15,
                width: deviceWidth * 0.15,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('icons/currency/usd.png', package: 'currency_icons'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('icons/currency/eur.png', package: 'currency_icons'),
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Text(
                DateFormat('MMM d, h:mm a').format(now),
              ),
              title: Text("From: USD   To: EUR"),
              subtitle: Text("Input: 3.5   Output: 50.6"),
            );
          },
        ),
      ),
    );
  }
}
