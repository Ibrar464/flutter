import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/ridecarDetails/ridecar_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideCarDetailScreen extends StatelessWidget {
  RideCarDetailScreen({Key? key}) : super(key: key);
  final RideCarDetailController _con = Get.put(RideCarDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "Ride Details",
        leading: "back",
        action: true,
        actionIcon: ImageConstant.notification,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _con.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: Get.height / 5,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primaryColor)),
                      child: GoogleMap(
                        mapType: _con.currentMapType,
                        onMapCreated: _con.onMapCreated,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              _con.locationData!.latitude!,
                              _con.locationData!.longitude!,
                            ),
                            zoom: 11),
                      ),
                    ),
              Text(
                "Here you can see rides that you have completed.",
                style: TextStyle(color: AppColors.subTextColor, fontSize: 12),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "05.01.2022 9:59 PM",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "580",
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Fortuner",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "5.4 km",
                    style: TextStyle(
                        color: AppColors.subTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Woodward st 13, 13 E98 London",
                    style: TextStyle(
                      color: AppColors.subTextColor,
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                height: 20,
                width: 4,
                decoration: BoxDecoration(
                    color: AppColors.containerBorderColor,
                    borderRadius: BorderRadius.circular(3)),
              ),
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Woodward st 13, 13 E98 London",
                    style: TextStyle(
                      color: AppColors.subTextColor,
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: Get.height / 5,
                width: Get.width,
                child: Image.asset(
                  ImageConstant.fortunercar,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Row(
                children: _con.featuresList
                    .asMap()
                    .map((index, value) {
                      return MapEntry(
                          index,
                          Container(
                            margin: const EdgeInsets.all(4),
                            height: 50,
                            width: Get.width / 4 - 16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppColors.containerBorderColor,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  _con.featuresList[index].image!,
                                  // height: 40,
                                  // width: 40,
                                ),
                                Text(
                                  _con.featuresList[index].label!,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )
                              ],
                            ),
                          ));
                    })
                    .values
                    .toList(),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          0.4,
                        ),
                        blurRadius: 1.20,
                        offset: const Offset(0.5, 0.6),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "I need Help with this ride",
                      style: TextStyle(color: AppColors.subTextColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.containerBorderColor,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          0.4,
                        ),
                        blurRadius: 1.20,
                        offset: const Offset(0.5, 0.6),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "I need Help with this ride",
                      style: TextStyle(color: AppColors.subTextColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.containerBorderColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
