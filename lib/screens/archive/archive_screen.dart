import 'package:convert_me/models/conversion.dart';
import 'package:convert_me/screens/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/archive_viewmodel.dart';
import '../shared/custom_app_bar.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);
  static String routeName = '/archive';

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(ArchiveScreen.routeName),
        body: Consumer<ArchiveViewModel>(
          builder: (context, archiveViewModel, child) {
            return Padding(
              padding: EdgeInsets.only(top: deviceHeight * 0.05),
              child: ListView.builder(
                itemCount: archiveViewModel.conversions.length,
                itemBuilder: (BuildContext context, int index) {
                  Conversion conversion = archiveViewModel.conversions[index];
                  return ListTile(
                    leading: SizedBox(
                      height: deviceWidth * 0.15,
                      width: deviceWidth * 0.15,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('icons/currency/${conversion.from.toLowerCase()}.png',
                                  package: 'currency_icons'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('icons/currency/${conversion.to.toLowerCase()}.png',
                                  package: 'currency_icons'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Text(
                      DateFormat('MMM d, h:mm a').format(conversion.date),
                    ),
                    title: Text("From: ${conversion.from}   To: ${conversion.to} "),
                    subtitle: Text("Input: ${conversion.ammount}    Output: ${conversion.result} "),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
