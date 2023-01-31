import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/features_model.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../models/availableCar_model.dart';

class DetailsController extends GetxController {
  final String id;
  DetailsController({required this.id});
  RxInt currentCarouselIndex = 0.obs;
  RxInt currentIndex = 0.obs;
  var current = 0.obs;
  var isselected = 0.obs;
  RxBool isLoading= false.obs;
  Car? car;

  final database = FirebaseDatabase.instance.ref("cars");

  RxList<Features> featuresList = RxList([
    Features(image: ImageConstant.speedometer, label: "420 km"),
    Features(image: ImageConstant.car, label: "420 km"),
    Features(image: ImageConstant.canister, label: "420 km"),
    Features(image: ImageConstant.seat, label: "420 km"),
  ]);

  @override
  onInit() async {
    isLoading.value = true;

    await getCars(id:id);

    isLoading.value = false;

    super.onInit();
  }

  getCars({required String id}) async {
    var snapshot = await database.child(id).get();

    // map.forEach((key, value) {
    //   // final user = User.fromMap(value);
    //   print(value);
    //   // list.add(user);
    // });

    if(snapshot.value != null){
      final map = snapshot.value as Map<dynamic, dynamic>;
      car = Car.fromMap(map);
      return;
    }
  }
}
