import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/rideHistory/ride_history_controller.dart';
import 'package:flutter/material.dart';

import '../../models/availableCar_model.dart';

class RideHistoryScreen extends StatelessWidget {
  RideHistoryScreen({Key? key}) : super(key: key);
  final RideHistoryController _con = Get.put(RideHistoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBar(
          text: "History",
          leading: "back",
          action: true,
          onPressed: () {},
        ),
        body: (!_con.isLoading.value)
            ? (_con.rentedCarList.isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        ListView.builder(
                          itemCount: _con.rentedCarList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: availableCar(_con.rentedCarList[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: Get.height,
                    child: Center(
                      child: Text("No History Yet"),
                    ),
                  )
            : SizedBox(
                height: Get.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
        // body: ListView.builder(
        //   itemCount: 8,
        //   itemBuilder: (context, i) {
        //     return Container(
        //       padding: const EdgeInsets.all(15),
        //       margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        //       height: Get.height / 5.5,
        //       width: Get.width,
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(15),
        //         border: Border.all(
        //           color: AppColors.containerBorderColor,
        //         ),
        //       ),
        //       child: Column(
        //         children: [
        //           Row(
        //             children: [
        //               Text(
        //                 "Fortuner",
        //                 style: TextStyle(
        //                   color: AppColors.subTextColor,
        //                   fontSize: 16,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //               const Spacer(),
        //               Row(
        //                 children: [
        //                   Image.asset(
        //                     ImageConstant.calandar,
        //                     height: 30,
        //                     width: 30,
        //                   ),
        //                   Text(
        //                     "Date: 10/10/17",
        //                     style: TextStyle(
        //                         color: AppColors.subTextColor, fontSize: 10),
        //                   )
        //                 ],
        //               ),
        //               Row(
        //                 children: [
        //                   Image.asset(
        //                     ImageConstant.time,
        //                     height: 30,
        //                     width: 30,
        //                   ),
        //                   Text(
        //                     "Time: 06:25 AM",
        //                     style: TextStyle(
        //                         color: AppColors.subTextColor, fontSize: 10),
        //                   )
        //                 ],
        //               )
        //             ],
        //           ),
        //           Expanded(
        //             child: Row(
        //               children: [
        //                 Column(
        //                   children: [
        //                     Image.asset(
        //                       ImageConstant.route,
        //                       height: 80,
        //                     ),
        //                   ],
        //                 ),
        //                 const SizedBox(
        //                   width: 10,
        //                 ),
        //                 Expanded(
        //                   child: Column(
        //                     children: [
        //                       Expanded(
        //                         child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             Column(
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                               children: [
        //                                 Text("Pickup point",
        //                                     style: TextStyle(
        //                                         fontSize: 10,
        //                                         color: AppColors.subTextColor,
        //                                         fontWeight: FontWeight.w400)),
        //                                 const Text("Benar Rode, dadi Ka Phatak",
        //                                     style: TextStyle(
        //                                         fontSize: 12,
        //                                         color: Colors.black,
        //                                         fontWeight: FontWeight.w500)),
        //                               ],
        //                             ),
        //                             Padding(
        //                               padding: const EdgeInsets.symmetric(
        //                                   horizontal: 15),
        //                               child: Column(
        //                                 children: [
        //                                   Image.asset(ImageConstant.car2),
        //                                   Text("8.5 km",
        //                                       style: TextStyle(
        //                                           fontSize: 12,
        //                                           color: AppColors.subTextColor,
        //                                           fontWeight: FontWeight.w400)),
        //                                 ],
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                       Expanded(
        //                         child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             Column(
        //                               crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                               children: [
        //                                 Text("Pickup point",
        //                                     style: TextStyle(
        //                                         fontSize: 10,
        //                                         color: AppColors.subTextColor,
        //                                         fontWeight: FontWeight.w400)),
        //                                 const Text("Benar Rode, dadi Ka Phatak",
        //                                     style: TextStyle(
        //                                         fontSize: 12,
        //                                         color: Colors.black,
        //                                         fontWeight: FontWeight.w500)),
        //                               ],
        //                             ),
        //                             const Text(
        //                               "\$440",
        //                               style: TextStyle(
        //                                 fontSize: 16,
        //                                 color: Colors.black,
        //                                 fontWeight: FontWeight.w500,
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }

  Widget availableCar(Car car) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailsScreen,
            arguments: {"id": car.id, "isDetail": 1});
      },
      child: Container(
        // padding: const EdgeInsets.only(left: 10),
        height: Get.height * .25,
        width: Get.width - 30,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.containerBorderColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              child: (car.image!.isEmpty)
                  ? Image.asset(
                      ImageConstant.fortunercar,
                      fit: BoxFit.cover,
                      width: Get.width / 2,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image(
                        image: CachedNetworkImageProvider(car.image!),
                        fit: BoxFit.fitWidth,
                        width: Get.width / 2,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                width: Get.width / 2 - 42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColors.secondaryColor),
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      car.brandName!,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      car.model!,
                      style: TextStyle(
                        color: AppColors.subTextColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          "Rs.",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          car.price!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
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
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
