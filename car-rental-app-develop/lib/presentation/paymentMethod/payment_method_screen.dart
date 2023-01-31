import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_text_field.dart';
import 'package:car_rental_app/presentation/commonWidgets/comman_widgets.dart';
import 'package:car_rental_app/presentation/paymentMethod/payment_method_controller.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);
  final PaymentMethodController _con = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          text: "Payment method",
          leading: "back",
          action: true,
          onPressed: () {},
          actionIcon: ImageConstant.notification),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              progressIndicatorBar(),
              const SizedBox(height: 10),
              commanTitle(text: "Card Details"),
              const SizedBox(height: 10),
              AppTextField(
                prefixIcon: Image.asset(
                  ImageConstant.person,
                  height: 20,
                ),
                hintText: "Name on card",
                errorMessage: _con.cardHoldernameError,
                controller: _con.cardHoldername,
                onChange: (value) {
                  // _con.cardHoldername.text = value.trim();
                  _con.cardHoldernameError.value = '';
                },
              ),
              const SizedBox(height: 10),
              AppTextField(
                prefixIcon: Image.asset(
                  ImageConstant.creditcard,
                  height: 20,
                ),
                hintText: "Name on card",
                errorMessage: _con.cardNoError,
                controller: _con.cardNo,
                onChange: (value) {
                  // _con.cardNo.text = value.trim();
                  _con.cardNoError.value = '';
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      prefixIcon: Image.asset(ImageConstant.expdate),
                      hintText: "Exp. date",
                      errorMessage: _con.expDateError,
                      controller: _con.expDate,
                      onChange: (value) {
                        // _con.cardNo.text = value.trim();
                        _con.expDateError.value = '';
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppTextField(
                      prefixIcon: Image.asset(
                        ImageConstant.cvv,
                        height: 20,
                      ),
                      hintText: "CVV",
                      errorMessage: _con.cvvError,
                      controller: _con.cvv,
                      onChange: (value) {
                        // _con.cardNo.text = value.trim();
                        _con.cvvError.value = '';
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              AppTextField(
                prefixIcon: Image.asset(ImageConstant.cvv, height: 20),
                hintText: "Password",
                errorMessage: _con.passwordError,
                controller: _con.password,
                onChange: (value) {
                  // _con.cardNo.text = value.trim();
                  _con.passwordError.value = '';
                },
              ),
              const SizedBox(height: 20),
              commanTitle(text: "Billing Information"),
              const SizedBox(height: 20),
              AppTextField(
                prefixIcon: Image.asset(ImageConstant.street),
                hintText: "Street address",
                errorMessage: _con.streetAdressError,
                controller: _con.streetAdress,
                onChange: (value) {
                  // _con.cardNo.text = value.trim();
                  _con.streetAdressError.value = '';
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      prefixIcon: Image.asset(ImageConstant.city),
                      hintText: "City",
                      errorMessage: _con.cityError,
                      controller: _con.city,
                      onChange: (value) {
                        // _con.cardNo.text = value.trim();
                        _con.cityError.value = '';
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppTextField(
                      prefixIcon: Image.asset(ImageConstant.state),
                      hintText: "State",
                      errorMessage: _con.stateError,
                      controller: _con.state,
                      onChange: (value) {
                        // _con.cardNo.text = value.trim();
                        _con.stateError.value = '';
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      prefixIcon: Image.asset(ImageConstant.zipcode),
                      hintText: "Zip Code",
                      errorMessage: _con.zipcodeError,
                      controller: _con.zipcode,
                      onChange: (value) {
                        // _con.cardNo.text = value.trim();
                        _con.zipcodeError.value = '';
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppTextField(
                      prefixIcon: Image.asset(ImageConstant.country),
                      hintText: "Country",
                      errorMessage: _con.countryError,
                      controller: _con.country,
                      onChange: (value) {
                        // _con.cardNo.text = value.trim();
                        _con.countryError.value = '';
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: AppButton(
                  onPressed: () {
                    _con.editProfile();
                  },
                  width: Get.width / 2,
                  text: "Pay",
                ),
              )
            ],
          ),
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
                  text: "Card",
                  color: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  bordercolor: AppColors.primaryColor),
              progressBar(
                  text: "Address",
                  color: Colors.white,
                  textColor: AppColors.subTextColor,
                  bordercolor: AppColors.containerBorderColor),
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
