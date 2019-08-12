import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsCover extends StatelessWidget {
  //Variables to recieve datas from MainCard (as per index)
  final String imagePath;
  final String venueName;
  final String venueLocation;
  final int numberStories;

  //Recieving Datas
  DetailsCover({
    this.imagePath,
    this.venueName,
    this.venueLocation,
    this.numberStories,
  });

  final Firestore locationsFSI = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: venueName + 'MainCard',
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.multiply,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              //Venue Name
              color: Colors.transparent,
              child: Text(
                venueName,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(height: 5),
            Material(
              //Venue Location + some other details.
              color: Colors.transparent,
              child: Text(
                venueLocation +
                    '  .  ' +
                    numberStories.toString() +
                    ' Stories',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: (MediaQuery.of(context).size.height / 3)),
          ],
        ),
      ),
    );
  }
}
