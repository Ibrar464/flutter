

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';



class UserController extends GetxController {
  RxBool login = false.obs;
  var isLoading=false.obs;
  var name=''.obs;
  var email=''.obs;
  var userid=''.obs;
  var list=[].obs;


  Future<bool> checkUserLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    login.value = pref.getBool('login') ?? false;

    if (pref.getBool('login') == true) {




      return true;
    } else {


 
      return false;
    }
  }


  Future saveData({
    String? correct,
    String? question,

}) async {
    print('getting');
    await FirebaseFirestore.instance
        .collection('Quize').doc(UniqueKey().toString()).set({
      "Question":question,
      "correct answer":correct,

    });
  }
  Future getData() async {
    isLoading(true);
    print('getting');
    await FirebaseFirestore.instance
        .collection('Quize').get().then((value){

          for(var data in value.docs){
            print(data.data());
            list.add(data.data());
            isLoading(true);

          }
    });
    isLoading(false);

  }



}