

import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/admin/dashboard/update_car.dart';
import 'package:flutter/material.dart';

import '../../../models/availableCar_model.dart';
import '../../auth/logout/app_dialog.dart';
import 'dashboard_controller.dart';

class AdminCarListScreen extends StatelessWidget {
  AdminCarListScreen({Key? key}) : super(key: key);
  final DashboardController _con = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _con.getRentedCars();
      },
      child: Obx(
        () => (!_con.isLoading.value)
            ? (_con.rentedCarList.isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Column(
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
                                  child: availableCar(_con.rentedCarList[index],context),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : ListView(children: [
                    SizedBox(
                      height: Get.height * 0.7,
                      child: Center(
                        child: Text("No History Yet"),
                      ),
                    ),
                  ])
            : SizedBox(
                height: Get.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }

  Widget availableCar(Car car, BuildContext context) {
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
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
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
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return UpdateCarScreen(car: car);
                              },));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black45,
                            )),
                        IconButton(
                            onPressed: () {
                              logoutDialog(
                                  context: Get.context,
                                  color: AppColors.primaryColor,
                                  description:
                                      "Are you sure you want to delete?",
                                  title: "Delete",
                                  buttonTitle: "Delete",
                                  onTap: () {
                                    _con.delete(car.id!);
                                    Get.back();
                                  });

                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
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
