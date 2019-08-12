import 'package:flutter/material.dart';

import '../logic/bloc.dart';
import './color_Radio.dart';
import '../logic/sharedPref_logic.dart';

//This Function saves the chosen Theme Color in SharedPreferences.
void showSettingsBottomSheet(context, radioList) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StreamBuilder(
        stream: bloc.recieveStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          bloc.feedStatus('false');
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 35),
            height: 240,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  'Choose an\n' 'Accent Color',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: radioList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          InkWell(
                            child: ColorRadio(
                              radioList[index].isActive,
                              radioList[index].colorName,
                              radioList[index].radioColor,
                            ),
                            onTap: () {
                              if (radioList[index].isActive) {
                                print('Already selected theme pressed');
                              } else {
                                radioList.forEach(
                                    (element) => element.isActive = false);
                                bloc.feedStatus('false');

                                radioList[index].isActive =
                                    (snapshot.data == 'true') ? true : false;
                                bloc.sinkColorName(radioList[index].colorName);
                                commitColor(radioList[index].colorName);
                              }
                            },
                          ),
                          SizedBox(
                              width: (index == radioList.length - 1)
                                  ? 0
                                  : ((MediaQuery.of(context).size.width -
                                          (70 + (50 * radioList.length))) /
                                      (radioList.length - 1))),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
