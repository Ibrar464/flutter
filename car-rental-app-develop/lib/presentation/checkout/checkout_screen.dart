import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/checkout/checkout_controller.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_text_field.dart';
import 'package:car_rental_app/presentation/commonWidgets/comman_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/availableCar_model.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  Car? car;

  final arguments = Get.arguments;

  final CheckoutController _con = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    car = Car.fromMap(arguments["car"]);
    return Scaffold(
      appBar: appBar(
        text: "Checkout",
        leading: "back",
        action: true,
        actionIcon: ImageConstant.notification,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: addressType,
          ),
        ),
      ),
    );
  }

  List<Widget> get addressType {
    return [
      const SizedBox(height: 10),
      availableCar(car!),
      const SizedBox(height: 10),
      progressIndicatorBar(),
      const SizedBox(height: 20),
      commanTitle(text: "Rent Details"),
      heading("How many days you need this car?"),
      AppTextField(
        keyboardType: TextInputType.phone,
        border: true,
        hintText: "Enter days ",
        color: Colors.white,
        errorMessage: _con.pincaodeError,
        controller: _con.pincaode,
        onChange: (value) {
          // _con.pincaode.text = value.trim();
          _con.pincaodeError.value = '';
        },
      ),
      const SizedBox(height: 20),
      commanTitle(text: "Address Details"),
      const SizedBox(height: 20),
      heading("User Name"),
      AppTextField(
        border: true,
        hintText: "User Name",
        color: Colors.white,
        errorMessage: _con.usernameError,
        controller: _con.username,
        onChange: (value) {
          // _con.username.text = value.trim();
          _con.usernameError.value = '';
        },
      ),
      heading("Address"),
      AppTextField(
        border: true,
        hintText: "Address",
        color: Colors.white,
        errorMessage: _con.addressError,
        controller: _con.address,
        onChange: (value) {
          // _con.address.text = value.trim();
          _con.addressError.value = '';
        },
      ),
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading("City"),
                AppTextField(
                  border: true,
                  hintText: "City",
                  color: Colors.white,
                  errorMessage: _con.cityError,
                  controller: _con.city,
                  onChange: (value) {
                    // _con.city.text = value.trim();
                    _con.cityError.value = '';
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading("Country"),
                AppTextField(
                  border: true,
                  hintText: "Country",
                  color: Colors.white,
                  errorMessage: _con.countryError,
                  controller: _con.country,
                  onChange: (value) {
                    // _con.country.text = value.trim();
                    _con.countryError.value = '';
                  },
                )
              ],
            ),
          ),
        ],
      ),
      // heading("Pin Code"),
      // AppTextField(
      //   border: true,
      //   hintText: "Pin Code",
      //   color: Colors.white,
      //   errorMessage: _con.pincaodeError,
      //   controller: _con.pincaode,
      //   onChange: (value) {
      //     // _con.pincaode.text = value.trim();
      //     _con.pincaodeError.value = '';
      //   },
      // ),
      heading("Mobile No."),
      AppTextField(
        border: true,
        hintText: "Mobile No.",
        color: Colors.white,
        errorMessage: _con.phoneNoError,
        controller: _con.phoneNo,
        onChange: (value) {
          // _con.phoneNo.text = value.trim();
          _con.phoneNoError.value = '';
        },
      ),
      const SizedBox(height: 30),
      commanTitle(text: "Driver"),
      const SizedBox(height: 20),
      ..._con.addressList
          .asMap()
          .map((i, value) => MapEntry(
                i,
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _con.addressType.value = i;
                          },
                          child: _con.addressType.value == i
                              ? Icon(Icons.radio_button_checked,
                              color: AppColors.primaryColor)
                              : const Icon(Icons.radio_button_unchecked,
                              color: Colors.grey),
                        ),
                        Text(
                          _con.addressList[i],
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.subTextColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
            ),
          ))
          .values
          .toList(),
      const SizedBox(height: 30),
      Center(
        child: AppButton(
          onPressed: () {
            _con.checkout(car!);
          },
          width: Get.width / 2,
          text: "Save",
        ),
      ),
    ];
  }

  Widget availableCar(Car car) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.detailsScreen, arguments: {"id": car.id});
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
                    Row(
                      children: [
                        const Spacer(),
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
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack progressIndicatorBar() {
    return Stack(
      children: [
        Positioned(
          top: 10,
          right: 10,
          left: 10,
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            height: 2,
            width: Get.width,
            color: AppColors.containerBorderColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              progressBar(
                  text: "Selected",
                  color: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor),
              progressBar(
                  text: "Address",
                  color: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor),
              progressBar(
                  text: "Payment",
                  color: Colors.white,
                  textColor: AppColors.subTextColor,
                  bordercolor: AppColors.containerBorderColor),
            ],
          ),
        ),
      ],
    );
  }

  Column progressBar({
    String? text,
    Color? color,
    Color? textColor,
    Color? bordercolor,
  }) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: bordercolor!)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text!,
          style: TextStyle(color: textColor),
        )
      ],
    );
  }
}
