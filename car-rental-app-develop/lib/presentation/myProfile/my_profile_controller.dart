import 'package:car_rental_app/core/app_export.dart';

class MyProfileController extends GetxController {
  RxList<MyProfile> myProfileList = RxList([
    MyProfile(image: ImageConstant.editprofile, text: "Edit Profile"),
    MyProfile(image: ImageConstant.carmodel, text: "Ride Details"),
    MyProfile(image: ImageConstant.policies, text: "Terms and Conditions"),
    MyProfile(image: ImageConstant.card, text: "Cards"),
    MyProfile(image: ImageConstant.setting, text: "Settings"),
  ]);
}

class MyProfile {
  String? image;
  String? text;

  MyProfile({
    this.image,
    this.text,
  });
}
