import 'package:flutter/material.dart';
import 'dart:math';

import 'package:labmid/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int number = 2;
  int answer = 0;
  int o1 = 0;
  int count = 0;
  bool test = false;
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Table Generator",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
             ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select number using slider'),
                  Slider(
                      value: number.toDouble(),
                      min: 1.0,
                      max: 100.0,
                      activeColor: Colors.red,
                      inactiveColor: Color(0xFF8D8E98),

                      onChanged: (double newvalue) {
                        setState(() {
                          test = false;
                          number = newvalue.round();
                        });
                      }),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        test = true;
                      });
                    },
                    child: Text('Generate Table'),
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: Colors.red),
                  ),
                ],
              ),
              Container(
                  child: Text(
                number.toString(),
                style: TextStyle(fontSize: 30),
              )),
              Container(
                height: 200,
                child: test
                    ? Container(
                        child: Column(
                          children: [
                            for (int i = 1; i <= 10; i++)
                              Text('${number} X ${i} = ${number * i}'),
                          ],
                        ),
                      )
                    : Container(),
              ),
              Container(
                height: 60,
                width: 150,
                child: TextButton(
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
                      primary: Colors.white, backgroundColor: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
