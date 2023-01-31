import 'dart:io';

import 'package:car_rental_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../commonWidgets/app_bar.dart';
import 'dashboard_controller.dart';

class AddCarScreen extends StatelessWidget {
  AddCarScreen({Key? key}) : super(key: key);

  final DashboardController con = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: appBar(
        text: "Add Cars",
        leading: "back",
        action: false,

      ),
      body: Obx(
            () =>
        (!con.isLoading.value) ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: con.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      con.pickImage();
                      print("Pick Image");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SizedBox(
                          child: (con.pickedFilePath.value.isNotEmpty)
                              ? Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                child: Image.file(
                                  File(con.pickedFilePath.value),
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                )),
                          )
                              : CircleAvatar(
                            radius: 50,
                            foregroundColor: Theme
                                .of(context)
                                .primaryColor,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: con.descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required field';
                        }
                        return null;
                      },
                      cursorColor: Theme
                          .of(context)
                          .accentColor,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelStyle:
                          TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                          labelText: "Description",
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          border: InputBorder.none,
                          errorStyle: const TextStyle(
                              fontSize: 10, height: 0.2),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5)))),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: con.brandNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required field';
                        }
                        return null;
                      },
                      cursorColor: Theme
                          .of(context)
                          .accentColor,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelStyle:
                          TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                          labelText: "Brand Name",
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          border: InputBorder.none,
                          errorStyle: const TextStyle(
                              fontSize: 10, height: 0.2),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5)))),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: con.modelController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required field';
                        }
                        return null;
                      },
                      cursorColor: Theme
                          .of(context)
                          .accentColor,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelStyle:
                          TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                          labelText: "Model",
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          border: InputBorder.none,
                          errorStyle: const TextStyle(
                              fontSize: 10, height: 0.2),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5)))),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: con.seatsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter number';
                        } else if (int.parse(value) < 1) {
                          return 'Please enter valid number';
                        } else if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                          return 'Please enter valid number';
                        }
                        return null;
                      },
                      cursorColor: Theme
                          .of(context)
                          .accentColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle:
                          TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                          labelText: "Number of seats",
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          border: InputBorder.none,
                          // prefixIcon: const Padding(
                          //   padding: EdgeInsets.only(left: 8.0),
                          //   child: Padding(
                          //     padding: EdgeInsets.only(bottom: 4.0),
                          //     child: Text(
                          //       " +92 - ",
                          //       style: TextStyle(
                          //           color: Colors.black, fontSize: 16),
                          //     ),
                          //   ),
                          // ),
                          prefixIconConstraints:
                          BoxConstraints(minWidth: 1, minHeight: 1),
                          errorStyle: const TextStyle(
                              fontSize: 10, height: 0.2),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5)))),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: con.perHourRateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter per day rate';
                        } else if (int.parse(value) < 0) {
                          return 'Please enter valid per day rate';
                        } else if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                          return 'Please enter valid per day rate';
                        }
                        return null;
                      },
                      cursorColor: Theme
                          .of(context)
                          .accentColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle:
                          TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                          labelText: "Rate Per Day",
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          border: InputBorder.none,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                " Rs. - ",
                                style:
                                TextStyle(color: Colors.black,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          prefixIconConstraints:
                          BoxConstraints(minWidth: 1, minHeight: 1),
                          errorStyle: const TextStyle(
                              fontSize: 10, height: 0.2),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.redAccent),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius:
                              const BorderRadius.all(
                                  Radius.circular(5)))),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Theme
                            .of(context)
                            .primaryColor,
                        value: con.isAutomatic.value,
                        shape: const CircleBorder(),
                        onChanged: (bool? value) {
                          con.isAutomatic.value = value!;
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Car is Automatic")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Theme
                            .of(context)
                            .primaryColor,
                        value: con.isDriver.value,
                        shape: const CircleBorder(),
                        onChanged: (bool? value) {
                          con.isDriver.value = value!;
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Is driver available.")
                    ],
                  ),
                  (con.isDriver.value)
                      ? SizedBox(
                    height: 70,
                    child: TextFormField(
                      controller: con.perHourRateWithDriverController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter per day rate';
                        } else if (int.parse(value) < 0) {
                          return 'Please enter valid per day rate';
                        } else if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
                          return 'Please enter valid per hour rate';
                        }
                        return null;
                      },
                      cursorColor: Theme
                          .of(context)
                          .accentColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Theme
                                  .of(context)
                                  .primaryColor),
                          labelText: "Driver Rate Per Day",
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          border: InputBorder.none,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                " Rs. - ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          prefixIconConstraints:
                          BoxConstraints(minWidth: 1, minHeight: 1),
                          errorStyle:
                          const TextStyle(fontSize: 10, height: 0.2),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.redAccent),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.redAccent),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5)))),
                    ),
                  )
                      : SizedBox(
                    height: 70,
                  ),
                  MaterialButton(
                    minWidth: w * 0.7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: AppColors.primaryColor,
                    onPressed: () {
                      if (con.formKey.currentState!.validate()) {
                        con.uploadCar();
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                  MaterialButton(
                    minWidth: w * 0.7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Theme
                        .of(context)
                        .errorColor,
                    onPressed: () async {
                      con.clear();
                      Get.back();
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ) : SizedBox(
          height: Get.height,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
