import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/auth/login/login_con.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController _con = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: appBar(
            text: "",
            leading: "back",
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Obx(
              () => ConstrainedBox(
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: (!_con.isLoading.value)
                        ? Column(
                            children: [
                              // const Spacer(),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                        child:
                                            Image.asset(ImageConstant.login)),
                                    Text(
                                      "Login",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.02),
                                    Text(
                                      'Welcome back!',
                                      style: TextStyle(
                                        color: AppColors.subTextColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.05),
                                    AppTextField(
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child:
                                              Image.asset(ImageConstant.email)),
                                      hintText: "Email",
                                      obsecureText: false,
                                      onChange: (value) {
                                        _con.email.value = value;
                                        _con.emailError.value = '';
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z0-9@_.-]"),
                                        ),
                                      ],
                                      errorMessage: _con.emailError,
                                    ),
                                    SizedBox(height: Get.height * 0.028),
                                    AppTextField(
                                        obsecureText:_con.isVisible.value,
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child:
                                            Image.asset(ImageConstant.password),
                                      ),
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            _con.isVisible.value = !_con.isVisible.value;
                                          },
                                          child: Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      hintText: "Password",
                                      onChange: (value) {
                                        _con.password.value = value;
                                        _con.passwordError.value = '';
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z0-9@_.-]"),
                                        ),
                                      ],
                                      errorMessage: _con.passwordError,
                                    ),
                                    SizedBox(height: Get.height * 0.01),
                                    Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(
                                            Icons.check,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        Text(
                                          "  Remember me",
                                          style: TextStyle(
                                              color: AppColors.subTextColor),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () {
                                            Get.toNamed(
                                                AppRoutes.forgotPasswordScreen);
                                          },
                                          child: Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                              color: Get.isDarkMode
                                                  ? Colors.white
                                                  : AppColors.primaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Get.height * 0.05),
                                    (_con.errortxt.isNotEmpty)
                                        ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _con.errortxt.value,
                                        style:
                                        TextStyle(color: Colors.redAccent),
                                      ),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(),
                                    ),
                                    Center(
                                      child: AppButton(
                                        text: "Login",
                                        width: Get.width / 2,
                                        onPressed: () {
                                          _con.login();
                                        },
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.03),
                                    Center(
                                      child: Text(
                                        "Or",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: Get.height * 0.03),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            _con.signInWithGoogle();
                                          },
                                          child: Container(
                                            height: Get.height * 0.07,
                                            width: Get.width * 0.25,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade400),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Image.asset(
                                              ImageConstant.google,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.05),
                                        // GestureDetector(
                                        //   onTap: (){
                                        //     _con.signInWithFacebook();
                                        //   },
                                        //   child: Container(
                                        //     height: Get.height * 0.07,
                                        //     width: Get.width * 0.25,
                                        //     padding: const EdgeInsets.all(10),
                                        //     decoration: BoxDecoration(
                                        //       border:
                                        //           Border.all(color: Colors.grey.shade400),
                                        //       borderRadius: BorderRadius.circular(15),
                                        //     ),
                                        //     child: Image.asset(
                                        //       ImageConstant.facebook,
                                        //     ),
                                        //   ),
                                        // ),
                                        // SizedBox(width: Get.width * 0.05),
                                        // Container(
                                        //   height: Get.height * 0.07,
                                        //   width: Get.width * 0.25,
                                        //   padding: const EdgeInsets.all(10),
                                        //   decoration: BoxDecoration(
                                        //     border:
                                        //         Border.all(color: Colors.grey.shade400),
                                        //     borderRadius: BorderRadius.circular(15),
                                        //   ),
                                        //   child: Image.asset(
                                        //     ImageConstant.apple,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: Get.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    // onTap: () => Get.toNamed(AppRoutes.signUpScreen),
                                    child: Text(
                                      "Don't Have an Account?".tr + ' ',
                                      style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white54
                                            : Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        Get.toNamed(AppRoutes.signUpScreen),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height * 0.02),
                            ],
                          )
                        : Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator())),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
