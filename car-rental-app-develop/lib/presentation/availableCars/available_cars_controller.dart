import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/availableCar_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class AvailableCarsController extends GetxController {
  RxBool isLoading = false.obs;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final databaseReference = FirebaseDatabase.instance.ref("cars");
  RxList availableCarList = [].obs;

  @override
  onInit() async {
    isLoading.value = true;

    await getCars();

    isLoading.value = false;
    super.onInit();
  }

  getCars() async {

    List<Car> carList = [];
    final snapshot = await databaseReference.get();
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

    // List<Car> carList = [];
    // QuerySnapshot querySnapshot = await fireStore.collection("cars").get();
    //
    // carList = querySnapshot.docs
    //     .map((e) => Car(
    //         id: e.id,
    //         image: ImageConstant.fortunercar,
    //         brandName: e["brandName"],
    //         model: e["model"],
    //         isAutomatic: e["isAutomatic"],
    //         seats: e["seats"],
    //         isDriver: e["isDriver"],
    //         driverPrice: e["driverPrice"],
    //         price: e["price"]))
    //     .toList();
    availableCarList.value = RxList(carList);
  }
}
