import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/list_card.dart';
import '../pages/story_page.dart';

class DetailsInfo extends StatelessWidget {
  final String description;
  final String locationID;

  DetailsInfo({
    this.description,
    this.locationID,
  });

  final Firestore locationsFSI = Firestore.instance;

  //This Page shows Stiories of a specific Location from FireStore.
  @override
  Widget build(BuildContext context) {
    double topSpace;
    double bottomSpace;

    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          height: MediaQuery.of(context).size.height - 100,
          constraints: BoxConstraints(minHeight: 160),
          child: StreamBuilder(
            stream: locationsFSI
                .collection('locations/' + locationID + '/stories')
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      topSpace = 30;
                      bottomSpace = 20;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            //Description of the venue, fetched from json.
                            description,
                            textAlign: TextAlign.left,
                            maxLines: 7,
                            style: TextStyle(
                              fontSize: 17,
                              height: 1.2,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            //Title of Stories.
                            'LOCAL STORIES',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff7c7c7c),
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: topSpace),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => StoryPage(
                                    storyImage: snapshot.data.documents[index]
                                        ['storyImage'],
                                    storyTitle: snapshot.data.documents[index]
                                        ['storyTitle'],
                                    storyTime: snapshot.data.documents[index]
                                        ['storyTime'],
                                    storyType: snapshot.data.documents[index]
                                        ['storyType'],
                                    storyDescription: snapshot.data
                                        .documents[index]['storyDescription'],
                                  ),
                                ),
                              );
                            },
                            child: ListCard(
                              storyImage: snapshot.data.documents[index]
                                  ['storyImage'],
                              storyTitle: snapshot.data.documents[index]
                                  ['storyTitle'],
                              storyTime: snapshot.data.documents[index]
                                  ['storyTime'],
                              storyType: snapshot.data.documents[index]
                                  ['storyType'],
                            ),
                          ),
                          SizedBox(height: bottomSpace),
                          Container(color: Color(0xffeeeeee), height: 1),
                        ],
                      );
                    }
                    if (index == snapshot.data.documents.length - 1) {
                      topSpace = 20;
                      bottomSpace = 20;
                      return Column(
                        children: <Widget>[
                          SizedBox(height: topSpace),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => StoryPage(
                                    storyImage: snapshot.data.documents[index]
                                        ['storyImage'],
                                    storyTitle: snapshot.data.documents[index]
                                        ['storyTitle'],
                                    storyTime: snapshot.data.documents[index]
                                        ['storyTime'],
                                    storyType: snapshot.data.documents[index]
                                        ['storyType'],
                                    storyDescription: snapshot.data
                                        .documents[index]['storyDescription'],
                                  ),
                                ),
                              );
                            },
                            child: ListCard(
                              storyImage: snapshot.data.documents[index]
                                  ['storyImage'],
                              storyTitle: snapshot.data.documents[index]
                                  ['storyTitle'],
                              storyTime: snapshot.data.documents[index]
                                  ['storyTime'],
                              storyType: snapshot.data.documents[index]
                                  ['storyType'],
                            ),
                          ),
                          SizedBox(height: bottomSpace),
                        ],
                      );
                    } else {
                      topSpace = 20;
                      bottomSpace = 20;
                      return Column(
                        children: <Widget>[
                          SizedBox(height: topSpace),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => StoryPage(
                                    storyImage: snapshot.data.documents[index]
                                        ['storyImage'],
                                    storyTitle: snapshot.data.documents[index]
                                        ['storyTitle'],
                                    storyTime: snapshot.data.documents[index]
                                        ['storyTime'],
                                    storyType: snapshot.data.documents[index]
                                        ['storyType'],
                                    storyDescription: snapshot.data
                                        .documents[index]['storyDescription'],
                                  ),
                                ),
                              );
                            },
                            child: ListCard(
                              storyImage: snapshot.data.documents[index]
                                  ['storyImage'],
                              storyTitle: snapshot.data.documents[index]
                                  ['storyTitle'],
                              storyTime: snapshot.data.documents[index]
                                  ['storyTime'],
                              storyType: snapshot.data.documents[index]
                                  ['storyType'],
                            ),
                          ),
                          SizedBox(height: bottomSpace),
                          Container(color: Color(0xffeeeeee), height: 1),
                        ],
                      );
                    }
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
