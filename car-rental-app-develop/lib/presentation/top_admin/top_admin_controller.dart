import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../models/availableCar_model.dart';

class TopAdminController extends GetxController{
  RxList userList = [].obs;
  RxBool isLoading = false.obs;
  final databaseReference = FirebaseDatabase.instance;

  @override
  onInit() async {
    isLoading.value = true;

    await getUsers();

    isLoading.value = false;
    super.onInit();
  }

  getUsers() async {
    List<UserModel> list = [];
    final snapshot = await databaseReference.ref("users").get();
    if (snapshot.exists) {
      var data = snapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        UserModel car = UserModel.fromMap(value["userDetail"]);
        list.add(car);
      });
      print(list);
    } else {
      print('No data available.');
    }
    userList.value = RxList(list);
  }

  void delete(String id) async {
    await databaseReference.ref('users').child(id).remove().then((val) {
      getUsers();
    });
  }
}