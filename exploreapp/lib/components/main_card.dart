import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/details_page.dart';

//This are the stars of the App, the main Widgets displaying covers of Locations.
class MainCard extends StatefulWidget {
  //Variables for datas recieved from json.
  final String imagePath;
  final String venueName;
  final String venueLocation;
  final String description;
  final String locationID;

  //Importing datas from json via explore_page.dart
  MainCard({
    this.imagePath,
    this.venueName,
    this.venueLocation,
    this.description,
    this.locationID,
  });

  @override
  _MainCardState createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  final Firestore locationsFSI = Firestore.instance;

  int numberStories = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Creates Details Page for respective Data.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DetailsPage(
              imagePath: widget.imagePath,
              venueName: widget.venueName,
              venueLocation: widget.venueLocation,
              description: widget.description,
              numberStories: numberStories,
              locationID: widget.locationID,
            ),
          ),
        );
      },
      child: Hero(
        tag: widget.venueName + 'MainCard',
        child: Container(
          width: MediaQuery.of(context).size.width - 60,
          padding: EdgeInsets.symmetric(horizontal: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[300],
            image: DecorationImage(
              image: NetworkImage(widget.imagePath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.multiply,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end, //Arranges from bottom.
            children: <Widget>[
              Material(
                //Venue Name
                color: Colors.transparent,
                child: Text(
                  widget.venueName,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 5),
              StreamBuilder(
                stream: locationsFSI
                    .collection('locations/' + widget.locationID + '/stories')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Material(
                      //Venue Location + some other details (When no data in snapshot).
                      color: Colors.transparent,
                      child: Text(
                        widget.venueLocation + '  .  0 Stories',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    numberStories = snapshot.data.documents.length;
                    return Material(
                      //Venue Location + some other details.
                      color: Colors.transparent,
                      child: Text(
                        widget.venueLocation +
                            '  .  ' +
                            snapshot.data.documents.length.toString() +
                            ' Stories',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              Material(
                //Explore Button
                color: Colors.transparent,
                child: Text(
                  'EXPLORE',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
