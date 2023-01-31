import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:car_rental_app/models/checkout_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/availableCar_model.dart';

class CheckoutController extends GetxController {

  final database = FirebaseDatabase.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  RxInt addressType = 0.obs;
  List addressList = [" With Driver", " Without Driver"];
  RxInt total = 0.obs;

  TextEditingController username = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincaode = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  RxString usernameError = ''.obs;
  RxString addressError = ''.obs;
  RxString cityError = ''.obs;
  RxString countryError = ''.obs;
  RxString pincaodeError = ''.obs;
  RxString phoneNoError = ''.obs;

  bool valid() {
    RxBool isValid = true.obs;
    usernameError.value = '';
    addressError.value = '';
    cityError.value = '';
    countryError.value = '';
    pincaodeError.value = '';
    phoneNoError.value = '';

    if (username.text.isEmpty) {
      usernameError.value = "Please enter a username";
      isValid.value = false;
    }
    if (address.text.isEmpty) {
      addressError.value = "Please enter a address";
      isValid.value = false;
    }
    if (city.text.isEmpty) {
      cityError.value = "Please enter a city name";
      isValid.value = false;
    }
    if (country.text.isEmpty) {
      countryError.value = "Please enter a city name";
      isValid.value = false;
    }
    if (pincaode.text.isEmpty) {
      pincaodeError.value = "Please enter a city name";
      isValid.value = false;
    }
    if (phoneNo.text.isEmpty) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phoneNo.text)) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    }

    return isValid.value;
  }

  checkout(Car car) {
    if (valid()) {
      RxInt days = int.parse(pincaode.text).obs;
      RxInt dp = int.parse(car.driverPrice!).obs;
      RxInt p = int.parse(car.price!).obs;
      if(addressType.value==0){
        total.value = dp.value * days.value;
      } else{
        total.value = p.value * days.value;
      }

      Map<String, dynamic> form = CheckoutForm(
        userid: firebaseAuth.currentUser!.uid,
          carid: car.id,
          isDriver:addressType.value,
          phoneNo:phoneNo.text,
          total:total.value,
          username:username.text,
          address:address.text,
          days:int.parse(pincaode.text),
          city:city.text,
          country:country.text
      ).toMap();
      // final key = database.push().key;
      // database.child("users/"+car.userid!+"/rentForms"+key!).set(form);
      Get.toNamed(AppRoutes.checkoutListScreen,arguments: {"form":form,"car":car.toMap()});
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
