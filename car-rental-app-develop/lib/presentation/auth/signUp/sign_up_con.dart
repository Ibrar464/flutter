import 'dart:io';

import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';
import '../../../models/user_model.dart';

class SignupController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance.ref("users");
  var storage = FirebaseStorage.instance;
  RxString pickedFilePath = "".obs;

  RxString fullname = "".obs;
  RxString fullnameError = ''.obs;
  RxString phoneNo = "".obs;
  RxString phoneNoError = ''.obs;
  RxString email = ''.obs;
  RxString emailError = ''.obs;
  RxString password = "".obs;
  RxString passwordError = ''.obs;
  RxBool isSeller = false.obs;
  RxBool isLoading = false.obs;

  RxBool tAc = false.obs;
  RxString tcError = "".obs;

  bool valid() {
    RxBool isValid = true.obs;
    fullnameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    phoneNoError.value = '';
    tcError.value = "";
    if (fullname.isEmpty) {
      fullnameError.value = "Please enter a valid username";
      isValid.value = false;
    }
    if (pickedFilePath.isEmpty) {
      tcError.value = "Please pick a profile picture";
      isValid.value = false;
    }
    if (email.isEmpty) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    }
    if (phoneNo.isEmpty) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phoneNo.value)) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    }
    if (password.isEmpty) {
      passwordError.value = "Please enter a valid password";
      isValid.value = false;
    } else if (!Helper.isPassword(password.value)) {
      passwordError.value = "The password must contain at least six character";
      isValid.value = false;
    }

    if (!tAc.value) {
      tcError.value = "*Please accept Terms and Conditions to continue";
      isValid.value = false;
    }
    return isValid.value;
  }

  Future<String> uploadImage(File file) async {
    isLoading.value = true;

    String name = DateTime.now().toString();

    try {
      var snapshot =
          await storage.ref().child("profilePictures/$name").putFile(file);

      if (snapshot.state == TaskState.success) {
        final String downloadUrl = await snapshot.ref.getDownloadURL();

        isLoading.value = false;

        return downloadUrl;
      } else {
        print('Error from audio repo ${snapshot.state.toString()}');

        return "";
      }
    } catch (e) {
      isLoading.value = false;

      return "";
    }
  }

  register() async {
    if (valid()) {
      try {
        User? user = await handleSignUp(email.toString(), password.toString());

        if(user !=null ){
          // if (user.emailVerified){
          //   if (isSeller.value == false) {
          //     Get.offAllNamed(AppRoutes.bottomBarScreen);
          //   } else {
          //     Get.offAllNamed(AppRoutes.dashboardScreen);
          //   }
          // }
          // else {
            try{

              await user.sendEmailVerification();
              Fluttertoast.showToast(
                  msg: "Email for verification is sent",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 10.0
              );
              Get.offAllNamed(AppRoutes.loginScreen);
            } on FirebaseException catch (err){
              tcError.value = err.message!;
            // }

          }
        } else {
          tcError.value = "Something went wrong!";
        }

      } on FirebaseAuthException catch (error) {
        isLoading.value = false;
        switch (error.code) {
          case "ERROR_EMAIL_ALREADY_IN_USE":
          case "account-exists-with-different-credential":
          case "email-already-in-use":
            tcError.value = "Email already used. Go to login page.";
            break;
          case "ERROR_WRONG_PASSWORD":
          case "wrong-password":
            tcError.value = "Wrong email/password combination.";
            break;
          case "ERROR_USER_NOT_FOUND":
          case "user-not-found":
            tcError.value = "No user found with this email.";
            break;
          case "ERROR_USER_DISABLED":
          case "user-disabled":
            tcError.value = "User disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
          case "operation-not-allowed":
            tcError.value = "Too many requests to log into this account.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
          case "operation-not-allowed":
            tcError.value = "Server error, please try again later.";
            break;
          case "ERROR_INVALID_EMAIL":
          case "invalid-email":
            tcError.value = "Email address is invalid.";
            break;
          default:
            tcError.value = "Login failed. Please try again.";
            break;
        }
      }

    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }

  Future pickImage() async {
    try {
      // final ImagePicker picker = ImagePicker();
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );

      if (image != null) {
        pickedFilePath.value = image.path;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> handleSignUp(email, password) async {
    String image = await uploadImage(File(pickedFilePath.value));

    if (image.isNotEmpty) {
      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        User user = result.user!;

        Map<String, dynamic> userModel = UserModel(
                image: image,
                id: user.uid,
                name: fullname.value,
                email: email,
                isSeller: isSeller.value,
                mobile: phoneNo.value)
            .toMap();

        database.child("${user.uid}").child("userDetail").set(userModel);
        Constants.userModel = UserModel.fromMap(userModel);
        return user;
      }
    }
    return null;
  }
}
