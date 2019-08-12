import 'package:shared_preferences/shared_preferences.dart';

import '../logic/bloc.dart';

//Function to load Theme Color from SharedPreferences
loadColor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bloc.sinkColorName(prefs.getString('themeColor') ?? 'Yellow');
}

//Function to store Theme Color from SharedPreferences
commitColor(data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('themeColor', data);
}

//Function to load Theme Color from SharedPreferences and update the Custom Radios.
loadColorForRadio(radioList) async {
  String themeColor;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  themeColor = prefs.getString('themeColor') ?? 'Yellow';
  for (int i = 0; i < radioList.length;) {
    if (radioList[i].colorName == themeColor) {
      radioList[i].isActive = true;
    }
    i++;
  }
}