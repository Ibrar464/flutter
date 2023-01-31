import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/ridehistory_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../models/availableCar_model.dart';

class RideHistoryController extends GetxController {
  RxList<RideHistory> rideHistoryList = RxList([]);
  RxList rentedCarList = [].obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance;
  RxBool isLoading = false.obs;

  @override
  onInit() async {
    isLoading.value = true;

    await getRentedCars();

    isLoading.value = false;
    super.onInit();
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
