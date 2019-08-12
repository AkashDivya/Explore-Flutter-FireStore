import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String displayValue;
  final String labelTitle;

  InfoCard({
    @required this.displayValue,
    @required this.labelTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Container(
            //This container prevents Parent Row from expandeing beyond width.
            width: MediaQuery.of(context).size.width - 160,
            child: Text(
              displayValue,
              maxLines: 2,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 5),
          Container(
            //This container prevents Parent Row from expandeing beyond width.
            width: MediaQuery.of(context).size.width - 160,
            child: Text(
              labelTitle,
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
    );
  }
}
