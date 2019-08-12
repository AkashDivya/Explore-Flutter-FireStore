import 'package:flutter/material.dart';

class StoryPage extends StatelessWidget {
  final String storyImage;
  final String storyTitle;
  final String storyTime;
  final String storyType;
  final String storyDescription;

  StoryPage({
    this.storyImage,
    this.storyTitle,
    this.storyTime,
    this.storyType,
    this.storyDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            //This is Back Arrow to Navigate Back.
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            //This Container gives Structure to the List View.
            height: MediaQuery.of(context).size.height - 88,

            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 35),
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  //Story Title
                  storyTitle,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  //Story Type & Time
                  storyTime + '  .  ' + storyType,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xffacacac),
                  ),
                ),
                SizedBox(height: 20),
                Hero(
                  tag: 'HeroTag ' + storyTitle,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: NetworkImage(storyImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  //Description of the venue, fetched from json.
                  storyDescription,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.2,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 30),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  fillColor: Colors.black,
                  constraints: BoxConstraints(minHeight: 50),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  textStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  child: Text('DONE'),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
