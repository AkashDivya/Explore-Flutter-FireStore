import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/explore_list.dart';

//This is a custom logic to perform Text Based Search from FireStore.
//a.k.a my biggest fear before implicating, Now its a piece of Cake.
searchedExploreList(datas, searchVal) {
  List<DocumentSnapshot> listLocal = [];
  for (int i = 0; i < datas.length; ++i) {
    if (datas[i]['venueName']
            .substring(
                0,
                (searchVal.length < datas[i]['venueName'].length)
                    ? searchVal.length
                    : datas[i]['venueName'].length)
            .toLowerCase() ==
        searchVal.toLowerCase()) {
      listLocal.add(datas[i]);
    }
  }
  return (listLocal.length != 0) ? exploreList(listLocal) : noSearch();
}
