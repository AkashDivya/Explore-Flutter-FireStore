import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/info_card.dart';
import '../components/externaLinkIcon.dart';
import '../components/page_heading.dart';

class MyProfilePage extends StatelessWidget {
  final Firestore adminFSI = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 30),
      children: <Widget>[
        pageHeader('About Me', 0),
        SizedBox(height: 20),
        StreamBuilder(
          stream: adminFSI.collection('admin').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    //The following condition assures that when the internet is not connected,
                    //the Stream builder doesn't throw an error about list.length == 0.
                    image: (snapshot.data.documents.length > 0)
                        ? NetworkImage(snapshot.data.documents[0]['adminPic'])
                        : AssetImage('assets/images/idle_grey.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          },
        ),
        SizedBox(height: 30),
        Text(
          'Hi there!',
          maxLines: 1,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            'This is Akash, I am a Badass Graphics Designer with 10 years of experience & now turned into a Developer. Flutter to be precise. Wanna know more, Check below.',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 20),
        InfoCard(
          displayValue: 'akash.apd@gmail.com',
          labelTitle: 'Email',
        ),
        SizedBox(height: 20),
        InfoCard(
          displayValue: 'Male',
          labelTitle: 'Gender',
        ),
        SizedBox(height: 20),
        InfoCard(
          displayValue: 'April 27, 1992',
          labelTitle: 'D.O.B.',
        ),
        SizedBox(height: 20),
        InfoCard(
          displayValue: 'Flutter Developer & Graphics Designer',
          labelTitle: 'Expertise',
        ),
        SizedBox(height: 30),

        //This contains links to external URLs.
        Container(
          padding: EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ExternalLinkIcon(
                linkIcon: 'assets/icons/dribbble_small.png',
                linkURL: 'https://dribbble.com/akashdivya',
              ),
              ExternalLinkIcon(
                linkIcon: 'assets/icons/linkedin_small.png',
                linkURL: 'https://www.linkedin.com/in/akash-divya-10552165/',
              ),
              ExternalLinkIcon(
                linkIcon: 'assets/icons/github_small.png',
                linkURL: 'https://github.com/AkashDivya',
              ),
              ExternalLinkIcon(
                linkIcon: 'assets/icons/youtube_small.png',
                linkURL:
                    'https://www.youtube.com/channel/UCo7mhMbZXaNgpyT7gM6mWDQ',
              ),
              ExternalLinkIcon(
                linkIcon: 'assets/icons/behance_small.png',
                linkURL: 'https://www.behance.net/AkashDivya',
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
