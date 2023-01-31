import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/brands_model.dart';

class FilterController extends GetxController {
  RxInt isSeatTap = 0.obs;
  RxList onSelectVehicleList = [].obs;
  RxList onSelectPriceList = [].obs;
  RxInt isSelect = 1.obs;

  RxList<Brands> brandsList = RxList([
    Brands(image: ImageConstant.jaguar),
    Brands(image: ImageConstant.kia),
    Brands(image: ImageConstant.hundai),
    Brands(image: ImageConstant.toyota),
  ]);

  List vehicleType = [
    'SUV',
    'XUV',
    'Plug-in Hybirid',
    'Jeep',
    'Pick Up',
    'Hatchback',
    'Hybirid',
    'Van',
  ];

  List priceRange = [
    "\$200 - \$300",
    '\$300 - \$600',
    '\$200,000 - \$500,000',
    '\$600,000 - \$900,000',
    '\$500,000 - \$800,000',
  ];

  List numberOfSeats = [
    "Any",
    '01',
    '02',
    '03',
    '4+',
  ];

  onSelectVehicle(int index) {
    if (onSelectVehicleList.contains(index)) {
      onSelectVehicleList.remove(index);
    } else {
      onSelectVehicleList.add(index);
    }
  }

  onSelectPrice(int index) {
    if (onSelectPriceList.contains(index)) {
      onSelectPriceList.remove(index);
    } else {
      onSelectPriceList.add(index);
    }
  }
}
