// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double textsize;
  final Color color;
  final double letterSpacing;
  const CustomText(
      {super.key,
      required this.text,
      required this.textsize,
      required this.color,
      required this.letterSpacing,
      required FontWeight fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: textsize,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
