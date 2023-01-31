import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/brands_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../models/availableCar_model.dart';

class DiscoverController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance;
  RxList availableCarList = [].obs;
  RxList rentedCarList = [].obs;

  @override
  onInit() async {
    isLoading.value = true;

    await getRentedCars();
    await getCars();

    isLoading.value = false;
    super.onInit();
  }

  RxList<Brands> brandsList = RxList([
    Brands(image: ImageConstant.jaguar),
    Brands(image: ImageConstant.kia),
    Brands(image: ImageConstant.hundai),
    Brands(image: ImageConstant.toyota),
  ]);

  getCars() async {

    List<Car> carList = [];
    final snapshot = await databaseReference.ref("cars").get();
    if (snapshot.exists) {
      var data = snapshot.value as Map<dynamic,dynamic>;
      data.forEach((key, value) {
        Car car = Car.fromMap(value);
        if(car.bookedTime!.isNotEmpty){
          DateTime dt1 = DateTime.parse(car.bookedTime!);
          DateTime dt2 = DateTime.now();
          if(dt1.compareTo(dt2)<0){
            carList.add(car);
          }
        } else {
          carList.add(car);
        }

      });
      print(carList);
    } else {
      print('No data available.');
    }

    // QuerySnapshot querySnapshot = await fireStore.collection("cars").get();
    //
    // carList = querySnapshot.docs
    //     .map((e) => Car(
    //           id: e.id,
    //           image: ImageConstant.fortunercar,
    //           brandName: e["brandName"],
    //           model: e["model"],
    //           isAutomatic: e["isAutomatic"],
    //           seats: e["seats"],
    //           price: e["price"],
    //           isDriver: e["isDriver"],
    //           driverPrice: e["driverPrice"],
    //         ))
    //     .toList();

    availableCarList.value = RxList(carList);
  }

  getRentedCars() async {
    List<Car> carList = [];
    final snapshot = await databaseReference.ref("users/"+firebaseAuth.currentUser!.uid+"/rentedCar").get();
    if (snapshot.exists) {
      var data = snapshot.value as Map<dynamic,dynamic>;
      data.forEach((key, value) {
        Car car = Car.fromMap(value);
        DateTime dt1 = DateTime.parse(car.bookedTime!);
        DateTime dt2 = DateTime.now();
        if(dt1.compareTo(dt2)>0){
          carList.add(car);
        }
      });
      print(carList);
    } else {
      print('No data available.');
    }
    rentedCarList.value = RxList(carList);
  }
}
