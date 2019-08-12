import 'package:flutter/material.dart';

//This class have Custom Radio button for Theme Colors with states.
class ColorRadio extends StatelessWidget {
  final bool isActive;
  final String colorName;
  final Color radioColor;

  ColorRadio(
    this.isActive,
    this.colorName,
    this.radioColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: radioColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(
        Icons.check,
        color: Colors.white.withOpacity((isActive) ? 1.0 : 0.0),
      ),
    );
  }
}
