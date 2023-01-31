import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_text_field.dart';
import 'package:car_rental_app/presentation/commonWidgets/comman_widgets.dart';
import 'package:car_rental_app/presentation/editProfile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final EditProfileController _con = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.only(left: 15, bottom: 2, right: 0, top: 2),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          title: const Text(
            "Edit Profile",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: Get.height / 3.8,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: Get.height * .14,
                        width: Get.height * .14,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Image.network(
                          (Constants.userModel!.image!.isEmpty)?
                          "https://static.toiimg.com/thumb/msid-68865435,width-800,height-600,resizemode-75,imgsize-179723,pt-32,y_pad-40/68865435.jpg":Constants.userModel!.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(Constants.userModel!.name!),
                    Text(Constants.userModel!.email!)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commanTitle(text: "Your Details"),
                    SizedBox(height: Get.height * 0.05),
                    AppTextField(
                      initialValue: _con.fullname.value,
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(ImageConstant.person)),
                      hintText: Constants.userModel!.name!,
                      obsecureText: false,
                      onChange: (value) {
                        _con.fullname.value = value.trim();
                        _con.fullnameError.value = '';
                      },
                      errorMessage: _con.fullnameError,
                    ),
                    SizedBox(height: Get.height * 0.028),
                    AppTextField(
                      initialValue: _con.phoneNo.value,
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            ImageConstant.call,
                            color: const Color(0xffB1B1B1),
                            height: 20,
                          )),
                      hintText: Constants.userModel!.mobile!,
                      obsecureText: false,
                      onChange: (value) {
                        _con.phoneNo.value = value.trim();
                        _con.phoneNoError.value = '';
                      },
                      errorMessage: _con.phoneNoError,
                    ),
                    SizedBox(height: Get.height * 0.028),

                    // SizedBox(height: Get.height * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Obx(
                                () => GestureDetector(
                              onTap: () {
                                _con.isSeller.value =
                                !_con.isSeller.value;
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                        0.4,
                                      ),
                                      blurRadius: 1.20,
                                      offset: const Offset(0.5, 0.6),
                                    ),
                                  ],
                                ),
                                child: Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    side: BorderSide(
                                        color: AppColors
                                            .containerBorderColor),
                                    value: _con.isSeller.value,
                                    activeColor: AppColors.secondaryColor,
                                    checkColor: AppColors.primaryColor,
                                    onChanged: (value) => _con.isSeller
                                        .value = !_con.isSeller.value,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "   Do you want to be a Seller",
                            style: TextStyle(
                                color: AppColors.subTextColor,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: AppButton(
                        onPressed: () {
                          _con.editProfile();
                        },
                        width: Get.width / 2,
                        text: "Save",
                      ),
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.subTextColor,
        ),
      ),
    );
  }
}
