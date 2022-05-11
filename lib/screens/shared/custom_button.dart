import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    this.active = true,
    required this.callback,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final Color color;
  final bool active;
  final callback;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return ElevatedButton.icon(
      onPressed: active ? callback : null,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize: Size(deviceWidth * 0.7, deviceHeight * 0.07),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(deviceWidth * 0.07),
        ),
      ),
    );
  }
}
