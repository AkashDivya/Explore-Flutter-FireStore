import 'package:flutter/material.dart';

//Headings of Tabs.
Widget pageHeader(String heading, double hZPadding) {
  return Container(
    //Page Heading
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: hZPadding),
    // height: 50,
    child: Text(
      heading,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
