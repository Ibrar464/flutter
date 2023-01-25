import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:middddd/Firebase/firebase_auth.dart';
import 'package:middddd/Firebase/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
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
              Text("Table Quiz App",style: GoogleFonts.bebasNeue(fontSize: 40)),
              SizedBox(height: 20,),
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
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(

                        onPressed: (){

                      if(email.text.isEmpty||password.text.isEmpty){
                        Get.snackbar('Alert', 'All Fields are required',
                        snackPosition: SnackPosition.BOTTOM
                        ) ;
                      }
                      else{
                        signin(email.text.trim(), password.text);
                      }

                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          )
                        ),
                        child: Text('Sign in',style: TextStyle(fontSize: 20),)),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  GestureDetector(
                    onTap: (){
                      Get.off(()=>SignupPage());
                    },
                    child: Text('Register',style: TextStyle(
                        fontSize: 18,
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
