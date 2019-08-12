import 'package:flutter/material.dart';

//Shows ListTile kind of Custom Widget to display Stories.
class ListCard extends StatelessWidget {
  final String storyImage;
  final String storyTitle;
  final String storyTime;
  final String storyType;

  ListCard({
    this.storyImage,
    this.storyTitle,
    this.storyTime,
    this.storyType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Hero(
          tag: 'HeroTag ' + storyTitle,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(storyImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[300],
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          children: <Widget>[
            Container(
              //This container prevents Parent Row from expandeing beyond width.
              width: MediaQuery.of(context).size.width - 160,
              child: Text(
                storyTitle,
                maxLines: 1,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 5),
            Container(
              //This container prevents Parent Row from expandeing beyond width.
              width: MediaQuery.of(context).size.width - 160,
              child: Text(
                storyTime + '  .  ' + storyType,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xffacacac),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
