import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

import '../pages/explore_page.dart';
import '../pages/maps_page.dart';
import '../pages/myprofile_page.dart';
import '../components/custom_appbar.dart';
import '../components/dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var connectivityStatus = 'Unknown';

  //This is verify the Internet Access.
  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> connectivitySubs;

  @override
  void initState() {
    super.initState();
    connectivitySubs =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityStatus = result.toString();
      if (result == ConnectivityResult.none) {
        noInternetDialog(context);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    connectivitySubs.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //The whole Code is wrapped in DefaultTabController to make it Controlled via Tabs
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),

          //CustomAppBar is wrapped under Theme(), so that CustomAppBar's canvasColor can be transparent and not the whole app's.

          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: CustomAppBar(),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height - 165,
          child: TabBarView(
            //TabBarView defines the area of TabPages

            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ExplorePage(),
              MapsPage(),
              MyProfilePage(),
            ],
          ),
        ),

        //Bottom Tabs
        bottomNavigationBar: TabBar(
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).accentColor,
          indicatorColor: Colors.yellowAccent.withOpacity(0.0),
          labelPadding: EdgeInsets.all(20),
          tabs: <Widget>[
            Tab(
              // Explore Tab
              icon: Icon(IconData(0xe800, fontFamily: 'TabIcons')),
            ),
            Tab(
              // Maps Tab
              icon: Icon(IconData(0xe801, fontFamily: 'TabIcons')),
            ),
            Tab(
              // Profile Tab
              icon: Icon(IconData(0xe802, fontFamily: 'TabIcons')),
            ),
          ],
        ),
      ),
    );
  }
}
