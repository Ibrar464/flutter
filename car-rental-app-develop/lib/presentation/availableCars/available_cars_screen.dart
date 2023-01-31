import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/availableCars/available_cars_controller.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../models/availableCar_model.dart';

class AvailableCarsScreen extends StatefulWidget {
  AvailableCarsScreen({Key? key}) : super(key: key);

  @override
  State<AvailableCarsScreen> createState() => _AvailableCarsScreenState();
}

class _AvailableCarsScreenState extends State<AvailableCarsScreen> {
  final AvailableCarsController _con = Get.put(AvailableCarsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "Available Cars",
        action: true,
        leading: "back",
      ),
      body: Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:(!_con.isLoading.value)? Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .68),
                    itemCount: _con.availableCarList.length,
                    itemBuilder: (context, index) {
                      return carTile(_con.availableCarList[index]);
                    }),
              )
            ],
          ):Center(
            child: SizedBox(
                child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }

  Widget carTile(Car car) {
    return Container(
      width: Get.width / 2 - 20,
      height: Get.height * .30,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerBorderColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     const Spacer(),
          //     Obx(
          //       () => GestureDetector(
          //         onTap: () {
          //           _con.fav.value = !_con.fav.value;
          //         },
          //         child: Container(
          //           margin: const EdgeInsets.all(10),
          //           height: 30,
          //           width: 30,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(7),
          //               color: AppColors.secondaryColor),
          //           child: Image.asset(
          //             ImageConstant.fav,
          //             color: _con.fav.value
          //                 ? Colors.red
          //                 : Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          (car.image!.isEmpty)
              ? SizedBox(
            child: Image.asset(
              ImageConstant.fortunercar,
              fit: BoxFit.fill,
              height: 75,
              width: Get.width / 2 - 20,
            ),
          )
              : SizedBox(
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              child: Image(
                image: CachedNetworkImageProvider(car.image!),
                fit: BoxFit.fitWidth,
                width: Get.width / 2,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              car.brandName!,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              car.model!,
              style: TextStyle(
                color: AppColors.subTextColor,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Image.asset(ImageConstant.car),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        (car.isAutomatic!) ? "Automatic" : "Manual",
                        style: TextStyle(
                            color: AppColors.subTextColor, fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      Image.asset(ImageConstant.seat),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        car.seats!,
                        style: TextStyle(
                            color: AppColors.subTextColor, fontSize: 10),
                      )
                    ],
                  )
                ],
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Rs.",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                    FittedBox(
                      child: Text(
                        car.price!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Text(
                      "/Day",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Book Now",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
