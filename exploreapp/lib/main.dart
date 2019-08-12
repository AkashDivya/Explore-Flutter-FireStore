import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './logic/bloc.dart';
import './pages/homepage.dart';
import './logic/sharedPref_logic.dart';
import './logic/theme_chooser.dart';

void main() {
  //Following codes Customizes the StatusBar & NavigationBar.
  //Services Package were imported for these.

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  //Following code will Force the App Orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    //Initially loads Theme Color from SharedPreferences
    loadColor();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //This StreamBuilder will listen data about chosen theme color and
      //change the UI acording to it.
      //This Stream is triggered from custom_appbar.dart

      stream: bloc.recieveColorName,
      initialData: 'Yellow',
      builder: (BuildContext context, AsyncSnapshot snapshot) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Explore App',

        //Global ThemeData for the App
        theme: ThemeData(
          primaryColor: themeChooser(snapshot.data),
          accentColor: Color(0xffb6b6b6),
          fontFamily: 'NotoSerif',
          scaffoldBackgroundColor: Colors.white,
        ),

        //The HomePage is being called here homepage.dart
        //Also the bloc is being transfered to HomePage here. Its Imp.
        home: HomePage(),
      ),
    );
  }
}
