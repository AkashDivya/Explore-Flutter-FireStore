import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/page_heading.dart';
import '../logic/map_logic.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Firestore locationsFSI = Firestore.instance;
  GoogleMapController mapController;

  //All these datas are coming from Firestore.
  List<DropdownMenuItem> locationsList = [];
  List<Marker> markersList = [];
  List<LatLng> locationsLatLng = [];
  LatLng chosenLatLng;
  LatLng currentLatLng;
  var displaySelectedLocation;
  var activeWidget;

  //This is the main Map Widget.
  Widget theMap() {
    return StreamBuilder(
      stream:
          locationsFSI.collection('locations').orderBy('venueName').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          locationsList = [
            DropdownMenuItem(
              child: Text('No Data Found'),
              value: 'No Data Found',
            )
          ];
        } else {
          locationsList = [];
          addDDMenuItems(snapshot.data.documents, locationsList);
          addMarkers(snapshot.data.documents, markersList);
          addLocationCoordinates(snapshot.data.documents, locationsLatLng);
        }
        return Column(
          children: <Widget>[
            pageHeader('Map', 30),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 50,
              padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonFormField(
                hint: Text('Choose a Location'),
                items: locationsList,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (currentLocationSelected) {
                  setState(() {
                    displaySelectedLocation = currentLocationSelected;
                  });
                  for (int i = 0; i < markersList.length; ++i) {
                    if (displaySelectedLocation ==
                        markersList[i].markerId.value) {
                      chosenLatLng = markersList[i].position;
                    }
                  }
                  moveToLocation(
                    zoom: 12,
                    latLng: chosenLatLng,
                    mapController: mapController,
                  );
                },
                value: displaySelectedLocation,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height - 310,
              width: MediaQuery.of(context).size.width - 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    zoom: 2,
                    target: LatLng(20.5937, 78.9629),
                  ),
                  markers: Set.from(markersList),
                  myLocationEnabled: true,
                  compassEnabled: true,
                  onMapCreated: assignMapController,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //This is placeholder for the main Map Widget, as the transition from
  //one Tab to another causes blinking as Map Tab is in between.
  
  Widget mapPlaceHolder() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 30, right: 30, top: 0),
      children: <Widget>[
        pageHeader('Map', 0),
        SizedBox(height: 20),
        Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffefefef),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonFormField(
            hint: Text('Choose a Location'),
            items: locationsList,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (currentLocationSelected) {},
            value: displaySelectedLocation,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 800,
          color: Color(0xffefefef),
        ),
      ],
    );
  }

  // This Function delays loading of the Map for smooth transition between Tabs.
  delayMap() async {
    await Future.delayed(Duration(milliseconds: 500));
    if (this.mounted) {
      setState(() {
        activeWidget = theMap();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    activeWidget = mapPlaceHolder();
  }

  //This function assigns controller to the Map.
  void assignMapController(controller) {
    setState(() {
      mapController = controller;
    });
  }

  //This the main Widget of the page which displays all the contents.
  @override
  Widget build(BuildContext context) {
    delayMap();
    return activeWidget;
  }
}
