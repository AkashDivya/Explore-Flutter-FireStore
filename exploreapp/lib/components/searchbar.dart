import 'package:flutter/material.dart';

import '../logic/bloc.dart';

//This is SearchBar.
class SearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            IconData(0xe804, fontFamily: 'TabIcons'),
            size: 20,
          ),
          hintText: 'Search',
        ),
        onChanged: (value) {
          bloc.feedSearchVal(value);
        },
      ),
      decoration: BoxDecoration(
        color: Color(0xffefefef),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
