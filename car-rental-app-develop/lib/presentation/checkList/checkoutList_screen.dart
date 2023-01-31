import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/availableCar_model.dart';
import 'package:car_rental_app/models/checkout_form.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/comman_widgets.dart';
import 'package:flutter/material.dart';

import 'checkoutList_controller.dart';

class CheckoutListScreen extends StatelessWidget {
  CheckoutListScreen({Key? key}) : super(key: key);
  CheckoutForm? checkoutForm;
  Car? car;
  final arguments = Get.arguments;

  final CheckoutListController _con = Get.put(CheckoutListController());

  @override
  Widget build(BuildContext context) {
    checkoutForm = CheckoutForm.fromMap(arguments["form"]);
    car = Car.fromMap(arguments["car"]);
    print(checkoutForm);

    return Scaffold(
      appBar: appBar(
        actionIcon: ImageConstant.notification,
        text: "Checkout List",
        leading: "back",
        action: true,
        onPressed: () {},
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: (!_con.isLoading.value)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    progressIndicatorBar(),
                    const SizedBox(height: 20),
                    commanTitle(text: "Summary"),
                    const SizedBox(height: 20),
                    availableCar(car!),
                    const SizedBox(height: 20),
                    invoice(
                        detail: "Per Day",
                        price: (checkoutForm!.isDriver == 0)
                            ? "Rs." + car!.driverPrice.toString()
                            : "Rs." + car!.price.toString()),
                    const SizedBox(height: 5),
                    invoice(
                        detail: "Trip Day",
                        price: checkoutForm!.days.toString()),
                    const SizedBox(height: 5),
                    Divider(color: AppColors.containerBorderColor),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          checkoutForm!.total.toString(),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // callButton(),
                        AppButton(
                          onPressed: () {
                            _con.check(checkoutForm!, car!);
                            // Get.toNamed(AppRoutes.thankYouScreen);
                          },
                          width: Get.width / 1.5,
                          text: "Lets Go",
                        ),
                      ],
                    )
                  ],
                )
              : SizedBox(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )),
        ),
      ),
    );
  }

  Container fromTo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: Get.width,
      height: Get.height / 6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.4,
            ),
            blurRadius: 1.20,
            offset: const Offset(0.5, 0.6),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    "Fri,29 Jan",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "10:00",
                    style: TextStyle(
                      color: AppColors.subTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Image.asset(ImageConstant.fromTo),
              Column(
                children: [
                  const Text(
                    "Sun, 31 Jan",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "13:30",
                    style: TextStyle(
                      color: AppColors.subTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(ImageConstant.location2),
              Text(
                "  Aliso Siantar, SF 214586",
                style: TextStyle(
                  color: AppColors.subTextColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ],
      ),
    );
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
                  ],
                ),
              ),
            ),
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
            maxHeight: 50.0,
          ),
          width: Get.width / 2.5,
          alignment: Alignment.center,
          child: Image.asset(
            ImageConstant.call,
            height: 20,
          ),
        ),
      ),
    );
  }

  Row invoice({String? detail, String? price}) {
    return Row(
      children: [
        Text(
          detail!,
          style: TextStyle(color: AppColors.subTextColor),
        ),
        const Spacer(),
        Text(
          price!,
          style: TextStyle(color: AppColors.primaryColor),
        )
      ],
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
                  text: "Card",
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
                  color: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor),
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
