import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/user_model.dart';

class EditProfileController extends GetxController {



  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance.ref("users");

  RxString fullname = "".obs;
  RxString fullnameError = ''.obs;
  RxString phoneNo = "".obs;
  RxString phoneNoError = ''.obs;
  RxString email = "".obs;
  RxString emailError = ''.obs;
  RxBool isSeller = false.obs;
  RxBool isLoading = false.obs;

  RxBool tAc = false.obs;
  RxString tcError = "".obs;

  @override
  onInit() async {
    isLoading.value = true;

    fullname.value = Constants.userModel!.name!;
    phoneNo.value  = Constants.userModel!.mobile!;
    email.value  = Constants.userModel!.email!;
    isSeller.value  = Constants.userModel!.isSeller!;


    isLoading.value = false;

    super.onInit();
  }

  bool valid() {
    RxBool isValid = true.obs;
    fullnameError.value = '';
    // emailError.value = '';
    phoneNoError.value = '';
    tcError.value = "";
    if (fullname.isEmpty) {
      fullnameError.value = "Please enter a valid username";
      isValid.value = false;
    }
    // if (pickedFilePath.isEmpty) {
    //   tcError.value = "Please pick a profile picture";
    //   isValid.value = false;
    // }
    // if (email.isEmpty) {
    //   emailError.value = "Please enter a valid email address";
    //   isValid.value = false;
    // } else if (!Helper.isEmail(email.value)) {
    //   emailError.value = "Please enter a valid email address";
    //   isValid.value = false;
    // }
    if (phoneNo.isEmpty) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    } else if (!Helper.isPhoneNumber(phoneNo.value)) {
      phoneNoError.value = "Please enter a valid Phone number";
      isValid.value = false;
    }

    // if (!tAc.value) {
    //   tcError.value = "*Please accept Terms and Conditions to continue";
    //   isValid.value = false;
    // }
    return isValid.value;
  }
  //
  // Future<String> uploadImage(File file) async {
  //   isLoading.value = true;
  //
  //   String name = DateTime.now().toString();
  //
  //   try {
  //     var snapshot =
  //     await storage.ref().child("profilePictures/$name").putFile(file);
  //
  //     if (snapshot.state == TaskState.success) {
  //       final String downloadUrl = await snapshot.ref.getDownloadURL();
  //
  //       isLoading.value = false;
  //
  //       return downloadUrl;
  //     } else {
  //       print('Error from audio repo ${snapshot.state.toString()}');
  //
  //       return "";
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //
  //     return "";
  //   }
  // }



  // Future pickImage() async {
  //   try {
  //     // final ImagePicker picker = ImagePicker();
  //     final XFile? image = await ImagePicker().pickImage(
  //       source: ImageSource.camera,
  //     );
  //
  //     if (image != null) {
  //       pickedFilePath.value = image.path;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  editProfile() async {
    if (valid()) {
      Map<String, dynamic> userModel = UserModel(
          image: Constants.userModel!.image!,
          id: Constants.userModel!.id!,
          name: fullname.value,
          email: Constants.userModel!.email!,
          isSeller: isSeller.value,
          mobile: phoneNo.value)
          .toMap();

      await database.child(Constants.userModel!.id!).child("userDetail").update(userModel).then((_) {
        Fluttertoast.showToast(
            msg: "Data Updated",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 10.0
        );
        Constants.userModel = UserModel.fromMap(userModel);
        Get.toNamed(AppRoutes.bottomBarScreen);
      }).catchError((onError) {
        Fluttertoast.showToast(
            msg: "Something went wrong!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 10.0
        );
      });

    } else {
      if (kDebugMode) {
        print("Not valid");
      }
    }
  }
}
