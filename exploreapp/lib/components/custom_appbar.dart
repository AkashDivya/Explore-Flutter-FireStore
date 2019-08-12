import 'package:flutter/material.dart';

import '../logic/sharedPref_logic.dart';
import '../components/themeChooser_modal.dart';

class CustomAppBar extends StatefulWidget {
  //This custom Function will show Modal BottomSheet
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  //This is the List that holds data of Theme Chooser Radio Buttons.
  List<RadioList> radioList = [
    RadioList(false, 'Yellow', Color(0xffEAC21E)),
    RadioList(false, 'Red', Color(0xffff3f20)),
    RadioList(false, 'Blue', Color(0xff00aeff)),
    RadioList(false, 'Green', Color(0xff00d000)),
    RadioList(false, 'Pink', Color(0xffff00a8)),
  ];

  //This Function loads Theme Color from ShharedPreferences and update radioList's active status
  @override
  void initState() {
    super.initState();
    loadColorForRadio(radioList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 40, 30, 5),
      alignment: Alignment.centerRight,
      height: 75,
      child: IconButton(
        //Thuis is the Settings Icon which launches Bottom Modal Sheet with Theme Options.
        padding: EdgeInsets.all(0),
        icon: Icon(
          IconData(0xe803, fontFamily: 'TabIcons'),
          color: Colors.black,
          size: 20,
        ),
        onPressed: () {
          setState(() {
            showSettingsBottomSheet(context, radioList);
          });
        },
      ),
    );
  }
}

class RadioList {
  bool isActive;
  final String colorName;
  final Color radioColor;

  RadioList(
    this.isActive,
    this.colorName,
    this.radioColor,
  );
}
