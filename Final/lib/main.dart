import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:middddd/Firebase/user_controller.dart';
import 'package:middddd/Firebase/user_service.dart';
import 'package:middddd/takeQuizScreen.dart';
import 'Firebase/login_page.dart';

Future initServices() async {
  await Get.putAsync(() => UserServices().init());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Table App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Get.put(UserController()).login.value
          ? MyHomePage(title: 'Flutter Demo Home Page')
          : LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool test = false;
  int number = 2;
  int count = 0;
  int answer = 0;
  int o1 = 0;
  int o2 = 0;
  Random random = Random();
  void randomNumber() {
    setState(() {
      count = random.nextInt(9) + 1;
      o1 = random.nextInt(9) + 1;
      o2 = random.nextInt(9) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 70,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select number using slider',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),

                Slider(
                    value: number.toDouble(),
                    min: 1.0,
                    max: 100.0,
                    activeColor: Colors.yellow,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue) {
                      setState(() {
                        test = false;
                        number = newvalue.round();
                      });
                    }),
                Container(
                    child: Text(
                      number.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.yellow),
                    )),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 2,right: 2,top: 2,bottom: 2),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: 'Enter Number',
                        labelText: 'Enter Starting Number'
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'Enter Number',
                      labelText: 'Enter Ending Number'
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        test = true;
                      });
                    },
                    child: Text('Generate Table'),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.yellow),
                  ),
                ),
              ],
            ),

            Divider(
              color: Colors.yellow,
            ),
            Container(
              height: 200,
              child: test
                  ? Container(
                      child: Column(
                        children: [
                          for (int i = 1; i <= 10; i++)
                            Text(
                              '${number}    X    ${i}    =    ${number * i}',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                        ],
                      ),
                    )
                  : Container(),
            ),
            Divider(
              color: Colors.yellow,
            ),
            SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    randomNumber();

                    answer = number * count;
                    o1 = o1 * number;
                    o2 = o2 * number;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => quiz(
                                number: number,
                                count: count,
                                answer: answer,
                                o1: o1,
                                o2: o2)));
                  });
                },
                child: Text('Take a Quiz'),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FittedBox(
          child: FloatingActionButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.offAll(() => LoginPage());
              },
              backgroundColor: Colors.yellow,
              child: Text(
                'SignOut',
                style: TextStyle(color: Colors.black, fontSize: 10),
              )),
        ),
      ),
    );
  }
}
