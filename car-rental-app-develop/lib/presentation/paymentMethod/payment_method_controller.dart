import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaymentMethodController extends GetxController {
  TextEditingController cardHoldername = TextEditingController();
  TextEditingController cardNo = TextEditingController();
  TextEditingController expDate = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController streetAdress = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipcode = TextEditingController();

  RxString cardHoldernameError = ''.obs;
  RxString cardNoError = ''.obs;
  RxString expDateError = ''.obs;
  RxString cvvError = ''.obs;
  RxString passwordError = ''.obs;

  RxString streetAdressError = ''.obs;
  RxString stateError = ''.obs;
  RxString cityError = ''.obs;
  RxString countryError = ''.obs;
  RxString zipcodeError = ''.obs;

  bool valid() {
    RxBool isValid = true.obs;
    cardHoldernameError.value = '';
    cardNoError.value = '';
    expDateError.value = '';
    cvvError.value = '';
    passwordError.value = '';

    streetAdressError.value = '';
    stateError.value = '';
    cityError.value = '';
    countryError.value = '';
    zipcodeError.value = '';

    if (cardHoldername.text.isEmpty) {
      cardHoldernameError.value = "Please enter a cardHoldername";
      isValid.value = false;
    }
    if (cardNo.text.isEmpty) {
      cardNoError.value = "Please enter a valid Credit card number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(cardNo.text)) {
      cardNoError.value = "Please enter a valid Credit card number";
      isValid.value = false;
    }
    if (expDate.text.isEmpty) {
      expDateError.value = "Please enter a expDate";
      isValid.value = false;
    }
    if (cvv.text.isEmpty) {
      cvvError.value = "Please enter a CVV";
      isValid.value = false;
    } else if (!Helper.isCVV(cvv.text)) {
      cvvError.value = "Please enter a valid CVV";
      isValid.value = false;
    }
    if (password.text.isEmpty) {
      passwordError.value = "Please enter a valid password";
      isValid.value = false;
    } else if (!Helper.isPassword(password.text)) {
      passwordError.value = "The password must contain at least six character";
      isValid.value = false;
    }

    if (streetAdress.text.isEmpty) {
      streetAdressError.value = "Please enter a address";
      isValid.value = false;
    }
    if (city.text.isEmpty) {
      cityError.value = "Please enter a city name";
      isValid.value = false;
    }
    if (state.text.isEmpty) {
      stateError.value = "Please enter a state name";
      isValid.value = false;
    }
    if (country.text.isEmpty) {
      countryError.value = "Please enter a city name";
      isValid.value = false;
    }
    if (zipcode.text.isEmpty) {
      zipcodeError.value = "Please enter a city name";
      isValid.value = false;
    }

    return isValid.value;
  }

  editProfile() {
    if (valid()) {
      Get.toNamed(AppRoutes.checkoutScreen);
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
