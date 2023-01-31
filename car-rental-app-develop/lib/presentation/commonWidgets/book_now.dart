import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/device_size.dart';
import 'package:flutter/material.dart';

Widget car() {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 10),
        width: Dsize.getSize(Get.width / 2 - 20, diffSize: 100),
        height: Dsize.getSize(240, diffSize: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.containerBorderColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: Dsize.getSize(25, diffSize: 10),
                  width: Dsize.getSize(25, diffSize: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.secondaryColor),
                  child: Image.asset(ImageConstant.fav),
                ),
              ],
            ),
            SizedBox(
                child: Image.asset(
              ImageConstant.fortunercar,
              fit: BoxFit.cover,
              height: 75,
              width: Get.width / 2 - 20,
            )),
            SizedBox(
              height: Dsize.getSize(4, diffSize: 2),
            ),
            const Text(
              "Fortuner",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "2021",
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
                      "Automatic",
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
                      "7 seats",
                      style: TextStyle(
                          color: AppColors.subTextColor, fontSize: 10),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ],
  );
}
