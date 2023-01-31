import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/myProfile/my_profile_controller.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key? key}) : super(key: key);
  final MyProfileController _con = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: Get.height * .14,
                      width: Get.height * .14,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
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
                    children: [
                      const Text(
                        "Andrey\nThompson",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "Edit profile",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(ImageConstant.edit)
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  doc(text: "License", image: ImageConstant.license),
                  doc(text: "Passport", image: ImageConstant.passport),
                  doc(text: "Contract", image: ImageConstant.contract),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ..._con.myProfileList
                  .asMap()
                  .map(
                    (i, value) => MapEntry(
                      i,
                      GestureDetector(
                        onTap: () {
                          i == 0
                              ? Get.toNamed(AppRoutes.editProfileScreen)
                              : i == 1
                                  ? Get.toNamed(AppRoutes.rideDetailsScreen)
                                  : i == 2
                                      ? Get.toNamed(AppRoutes.rideDetailsScreen)
                                      : i == 3
                                          ? Get.toNamed(
                                              AppRoutes.paymentMethodScreen)
                                          : i == 4
                                              ? Get.toNamed(
                                                  AppRoutes.settingScreen)
                                              : Get.toNamed(
                                                  AppRoutes.editProfileScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.only(bottom: 10),
                          width: Get.height,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset(_con.myProfileList[i].image!),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                _con.myProfileList[i].text!,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Color(0xffB5B5B5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
              const SizedBox(
                height: 10,
              ),
              logoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton() {
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
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 40,
            maxHeight: 50,
          ),
          width: Get.width / 2,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageConstant.logout),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget doc({String? text, String? image}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          height: Get.height * .13,
          width: Get.height * .13,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20,
                offset: Offset(0.5, 0.6),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(image!)
            ],
          )),
    );
  }
}
