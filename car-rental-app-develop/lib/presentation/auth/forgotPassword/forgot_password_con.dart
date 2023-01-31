import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxString email = "".obs;
  RxString emailError = "".obs;

  bool valid() {
    RxBool isValid = true.obs;

    emailError.value = '';
    if (email.isEmpty) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    }

    return isValid.value;
  }

  forgotPassword() async {
    if (valid()) {
      await firebaseAuth
          .sendPasswordResetEmail(email: email.value)
          .then((value) {
        Fluttertoast.showToast(
            msg: "Check Your Email",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 10.0);
        Get.back();
      }).catchError((e) {
        Fluttertoast.showToast(
            msg: "Something went wrong!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 10.0);
      });
    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
