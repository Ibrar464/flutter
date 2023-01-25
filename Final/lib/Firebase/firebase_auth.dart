// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:middddd/Firebase/login_page.dart';
import 'package:middddd/Firebase/user_controller.dart';
import 'package:middddd/main.dart';
import 'package:middddd/takeQuizScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final UserController _userController = Get.put(UserController());

Future signup({
  String? name,
  String? email,
  String? password,
  String? confirmPasswor,

}) async {

  try {
    _userController.isLoading(false);

    final _userCredentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password.toString(),
    );

    if (_userCredentials.user != null) {
      _userController.isLoading(false);

      Get.offAll(() => MyHomePage(title: 'quize'));
      setupCache();


    }
  } on FirebaseAuthException catch (e) {
    _userController.isLoading(false);

    Get.back();
    debugPrint(e.code);
    if (e.code == 'email-already-in-use') {
      Get.snackbar('Alert',               "Looks like you already has a account.\nTry sigining in to your account instead of creating a new account.",
     snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white
      );
    } else if (e.code == 'account-exists-with-different-credential') {
      Get.snackbar(

        'alert',              "Looks like you already has a account.\nTry sigining in to your account instead of creating a new account.",


snackPosition: SnackPosition.BOTTOM,
         backgroundColor: Colors.black,
        colorText: Colors.white

      );
    } else {
      Get.snackbar(
       'Error',
        "Some thing went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white
      );
    }
    return false;
  } catch (e) {
  _userController.isLoading(false);
    Get.snackbar(
        'Error',
        "Some thing went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white
    );
  }
}


Future setupCache() async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();


  _prefs.setBool('login', true);
  _prefs.setString('userid', _userController.userid.value);
}

Future signin(String email, String password) async {

  try {
    _userController.isLoading(true);

    final _userCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.toString(),
      password: password.toString(),
    );



    if (_userCredentials.user != null) {
      setupCache();
      Get.offAll(() => MyHomePage(title: 'quize'));


    }

  } on FirebaseAuthException catch (e) {
    _userController.isLoading(false);

    Get.back();
    if (e.code == 'user-not-found') {
      Get.snackbar('Alert',
        'No account found',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white

      );
    } else if (e.code == 'wrong-password') {
      Get.snackbar(
        'Alert',
        'Invalid Password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white

      );
    } else {
      Get.snackbar(
          'Error',
          "Some thing went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white
      );
    }
    return false;
  } catch (e) {
   _userController.isLoading(false);
    debugPrint(e.toString());

  }
}


Future logout() async {
  await FirebaseAuth.instance.signOut();



  await clearCache();
  Get.offAll(() => const LoginPage());
}

Future clearCache() async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setBool('login', false);
  _prefs.setString('userid', '');

  print('logout');

  _userController.login.value = false;

}




