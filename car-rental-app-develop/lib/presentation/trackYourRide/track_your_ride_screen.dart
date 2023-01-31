import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/trackYourRide/track_your_ride_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackYourCarScreen extends StatelessWidget {
  TrackYourCarScreen({Key? key}) : super(key: key);
  final TrackYourRideController _con = Get.put(TrackYourRideController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        actionIcon: ImageConstant.notification,
        text: "Trek Your car",
        leading: "back",
        action: true,
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            _con.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: Get.height / 2.2,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
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
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 10),
              height: Get.height / 3.5,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.primaryColor)),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          height: Get.height * .08,
                          width: Get.height * .08,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              border:
                                  Border.all(color: AppColors.primaryColor)),
                          child: Image.network(
                            "https://static.toiimg.com/thumb/msid-68865435,width-800,height-600,resizemode-75,imgsize-179723,pt-32,y_pad-40/68865435.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Andrey Thompson",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "andreythompson0145@gmail.com",
                            style: TextStyle(
                                color: AppColors.subTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              ImageConstant.route,
                              height: 80,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Pickup point",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.subTextColor,
                                                fontWeight: FontWeight.w400)),
                                        const Text("Benar Rode, dadi Ka Phatak",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        children: [
                                          Image.asset(ImageConstant.car2),
                                          Text("8.5 km",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.subTextColor,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Pickup point",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.subTextColor,
                                                fontWeight: FontWeight.w400)),
                                        const Text("Benar Rode, dadi Ka Phatak",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    const Text(
                                      "\$440",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      callButton(),
                      const SizedBox(width: 10),
                      AppButton(
                        height: 50,
                        onPressed: () {
                          Get.toNamed(AppRoutes.chatScreen);
                        },
                        width: Get.width / 3,
                        text: "Message",
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton callButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 40.0,
          ),
          width: Get.width / 3,
          alignment: Alignment.center,
          child: Text(
            "call",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
