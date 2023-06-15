import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class RestaurantManager {
  final CollectionReference restaurantList = FirebaseFirestore.instance.collection("restaurants");


  Future getRestaurantsList()async{
    List restaurantsList = [];
    try{
      debugPrint("data getting");
      await restaurantList.get().then((querySnapshot) => {
        querySnapshot.docs.forEach((element) {
          restaurantsList.add(element.data());
        })
      });
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

}