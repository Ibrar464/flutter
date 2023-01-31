import 'dart:io';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/availableCar_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/ridehistory_model.dart';

class DashboardController extends GetxController {

  RxList<RideHistory> rideHistoryList = RxList([]);
  RxList rentedCarList = [].obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance;
  final database = FirebaseDatabase.instance.ref("cars");
  var storage = FirebaseStorage.instance;
  RxString text = "hello".obs;
  int activeCurrentStep = 0;
  RxString userid = "".obs;
  RxBool isLoading = false.obs;
  RxInt pageIndex = 0.obs;
  RxInt drawer = 0.obs;
  final formKey = GlobalKey<FormState>();
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  List icons = [
    [ImageConstant.home, ImageConstant.activeHome],
    [ImageConstant.email, ImageConstant.email],
  ];

  List drawerList = [
    ["Logout", ImageConstant.logouticon],
  ];


  @override
  onInit() async {
    isLoading.value = true;

    await getRentedCars();
    userid.value = await firebaseAuth.currentUser!.uid;

    isLoading.value = false;
    super.onInit();
  }

  getRentedCars() async {
    List<Car> carList = [];
    final snapshot = await databaseReference.ref("cars").get();
    if (snapshot.exists) {
      var data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        Car car = Car.fromMap(value);

        if (car.userid == firebaseAuth.currentUser!.uid) {
          carList.add(car);
        }
      });
      print(carList);
    } else {
      print('No data available.');
    }
    rentedCarList.value = RxList(carList);
  }

  void delete(String id) async {
    await databaseReference.ref('cars').child(id).remove().then((val) {
      getRentedCars();
    });
  }


  // Car details
  RxString pickedFilePath = "".obs;
  RxBool isAutomatic = false.obs;
  RxBool isDriver = false.obs;
  RxBool isAvailable = true.obs;

  TextEditingController brandNameController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController perHourRateController = TextEditingController();
  TextEditingController perHourRateWithDriverController = TextEditingController();

  Future<String> uploadImage(File file) async {
    isLoading.value = true;

    String name = DateTime.now().toString();

    try {
      var snapshot = await storage.ref().child("profilePictures/$name").putFile(file);

      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();

        isLoading.value = false;

        return downloadUrl;
      } else {
        print('Error from audio repo ${snapshot.state.toString()}');

        return "";
      }
    } catch (e) {
      isLoading.value = false;

      return "";
    }
  }

  Future pickImage() async {
    try {
      // final ImagePicker picker = ImagePicker();
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        pickedFilePath.value = image.path;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future uploadCar() async {
    isLoading.value = true;



    String image = await uploadImage(File(pickedFilePath.value));
    if(image.isNotEmpty){
      final key = database.push().key;
      Map<String, dynamic> car = Car(
          description: descriptionController.text,
          bookedTime: "",
          userid: userid.value,
          id: key,
          image: image,
          brandName: brandNameController.text,
          model: modelController.text,
          isAutomatic: isAutomatic.value,
          seats: seatsController.text,
          isDriver: isDriver.value,
          driverPrice: perHourRateWithDriverController.text,
          price: perHourRateController.text)
          .toMap();

      database.child(key!).set(car);
      clear();

      await getRentedCars();


      isLoading.value = false;
    }

  }

  Future updateCar(String  img,String id) async{
    isLoading.value = true;

    if(pickedFilePath.isEmpty){
        Map<String, dynamic> car = Car(
            description: descriptionController.text,
            bookedTime: "",
            userid: userid.value,
            id: id,
            image: img,
            brandName: brandNameController.text,
            model: modelController.text,
            isAutomatic: isAutomatic.value,
            seats: seatsController.text,
            isDriver: isDriver.value,
            driverPrice: perHourRateWithDriverController.text,
            price: perHourRateController.text)
            .toMap();

        await database.child(id).update(car).then((_) {
          Fluttertoast.showToast(
              msg: "Data Updated",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 10.0
          );
          Get.back();
        }).catchError((onError) {
          Fluttertoast.showToast(
              msg: "Something went wrong!",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 10.0
          );
        });
    } else {
      String image = await uploadImage(File(pickedFilePath.value));
      if(image.isNotEmpty){

        Map<String, dynamic> car = Car(
            description: descriptionController.text,
            bookedTime: "",
            userid: userid.value,
            id: id,
            image: image,
            brandName: brandNameController.text,
            model: modelController.text,
            isAutomatic: isAutomatic.value,
            seats: seatsController.text,
            isDriver: isDriver.value,
            driverPrice: perHourRateWithDriverController.text,
            price: perHourRateController.text)
            .toMap();

        await database.child(id).update(car).then((_) {
          Fluttertoast.showToast(
              msg: "Data Updated",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 10.0
          );
          Get.back();
        }).catchError((onError) {
          Fluttertoast.showToast(
              msg: "Something went wrong!",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 10.0
          );
        });

      }
    }

    clear();
    await getRentedCars();
    isLoading.value = false;
  }

  clear() {
    brandNameController.clear();
    modelController.clear();
    seatsController.clear();
    descriptionController.clear();
    perHourRateController.clear();
    perHourRateWithDriverController.clear();
    pickedFilePath.value ="";
  }

  logOut() async {
    await firebaseAuth.signOut();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
