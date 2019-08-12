import 'package:flutter/material.dart';

//Logic to determine ThemeColor from retrieved Data from Shared Prefs.
themeChooser(data) => (data == 'Yellow')
    ? Color(0xffEAC21E)
    : (data == 'Red')
        ? Color(0xffff3f20)
        : (data == 'Blue')
            ? Color(0xff00aeff)
            : (data == 'Green')
                ? Color(0xff00d000)
                : (data == 'Pink') ? Color(0xffff00a8) : Colors.grey;

