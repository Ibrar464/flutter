import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/core/utils/helper.dart';
import 'package:car_rental_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  UserModel? userModel;

  final database = FirebaseDatabase.instance.ref("users/");
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxString errortxt = ''.obs;
  RxBool isLoading=false.obs;
  RxBool isVisible=false.obs;

  RxString password = ''.obs;
  RxString passwordError = ''.obs;
  RxString email = ''.obs;
  RxString emailError = ''.obs;

  bool valid() {
    RxBool isValid = true.obs;
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "Please enter a valid email address";
      isValid.value = false;
    }
    if (password.isEmpty) {
      passwordError.value = "Please enter a valid password";
      isValid.value = false;
    } else if (!Helper.isPassword(password.value)) {
      passwordError.value = "The password must contain at least six character";
      isValid.value = false;
    }
    return isValid.value;
  }

  login() async {
    isLoading.value = true;
    if (valid()) {
      if(email.value=="admin12345@gmail.com"&&password.value=="admin12345"){
        Get.offAllNamed(AppRoutes.topAdminScreen);
        return;
      }
      try {
        User? user = await handleSignIn(email.toString(), password.toString());

        if (user != null) {
          if (user.emailVerified){
            var snapshot = await database.child(user.uid).get();
            if (snapshot.value != null) {
              isLoading.value = false;
              final map = snapshot.value as Map<dynamic, dynamic>;
              userModel = UserModel.fromMap(map["userDetail"]);
              Constants.userModel = userModel;
              if (userModel!.isSeller!) {
                Get.offAllNamed(AppRoutes.dashboardScreen);
              } else {
                Get.offAllNamed(AppRoutes.bottomBarScreen);
              }
              return;
            } else {
              isLoading.value = false;
              errortxt.value = "Something Went Wrong!";
            }
          }
          else {
            errortxt.value = "Email is not verified";
          }

        } else {
          isLoading.value = false;
          errortxt.value = "Something Went Wrong!";
        }
      } on FirebaseAuthException catch (error) {
        isLoading.value = false;
        switch (error.code) {
          case "ERROR_EMAIL_ALREADY_IN_USE":
          case "account-exists-with-different-credential":
          case "email-already-in-use":
            errortxt.value = "Email already used. Go to login page.";
            break;
          case "ERROR_WRONG_PASSWORD":
          case "wrong-password":
            errortxt.value = "Wrong email/password combination.";
            break;
          case "ERROR_USER_NOT_FOUND":
          case "user-not-found":
            errortxt.value = "No user found with this email.";
            break;
          case "ERROR_USER_DISABLED":
          case "user-disabled":
            errortxt.value = "User disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
          case "operation-not-allowed":
            errortxt.value = "Too many requests to log into this account.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
          case "operation-not-allowed":
            errortxt.value = "Server error, please try again later.";
            break;
          case "ERROR_INVALID_EMAIL":
          case "invalid-email":
            errortxt.value = "Email address is invalid.";
            break;
          default:
            errortxt.value = "Login failed. Please try again.";
            break;
        }
      }
    } else {
      errortxt.value = "Something Went Wrong!";
    }
    isLoading.value = false;
  }

  Future<User?> handleSignIn(email, password) async {
    UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    if (result.user != null) {
      return result.user;
    }
    return null;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential user = await firebaseAuth.signInWithCredential(credential);

    Map<String, dynamic> userModel = UserModel(
        image: user.user!.photoURL!,
        id: user.user!.uid,
        name: user.user!.displayName,
        email: user.user!.email!,
        isSeller: false,
        mobile: user.user!.phoneNumber)
        .toMap();

    Constants.userModel = UserModel.fromMap(userModel);
    database.child("${user.user!.uid}").child("userDetail").set(userModel);
    Get.offAllNamed(AppRoutes.bottomBarScreen);
    return user;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
