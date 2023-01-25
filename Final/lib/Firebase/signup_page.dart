import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:middddd/Firebase/firebase_auth.dart';
import 'package:middddd/Firebase/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Enter Name',
                    labelText: 'Name'
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Enter Email',
                    labelText: 'Email'
                ),
              ),
              SizedBox(height: 10,),

              TextField(
                controller: password,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Enter password',
                    labelText: 'Password'
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: confirmPassword,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: 'Confirm password',
                    labelText: 'Confirm Password'
                ),
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(onPressed: () {
                      if (email.text.isEmpty || password.text.isEmpty ||
                          name.text.isEmpty || confirmPassword.text.isEmpty) {
                        Get.snackbar('Alert', 'All Fields are required',
                            snackPosition: SnackPosition.BOTTOM
                        );
                      }
                      else {
                        if(password.text==confirmPassword.text){
                          signup(
                              name:name.text,
                              email: email.text.trim(),
                              password: password.text


                          );
                        }else{
                          Get.snackbar('Alert', 'Password not matched',
                              snackPosition: SnackPosition.BOTTOM
                          );
                        }
                      }
                    },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            )
                        ),
                        child: Text('Sign up',style: TextStyle(fontSize: 20),)),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => LoginPage());
                    },
                    child: Text('Sign in', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
