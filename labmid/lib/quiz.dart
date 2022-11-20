import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'main.dart';

class quiz extends StatefulWidget {
  const quiz({
    Key? key,
    this.number,
    this.count,
    this.answer,
    this.o1,
    this.o2,
  }) : super(key: key);
  final number;
  final count;
  final answer;
  final o1;
  final o2;

  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  late int number = widget.number;
  late int count = widget.count;
  late int answer = widget.answer;
  late int o1 = widget.o1;
  late int o2 = widget.o2;

  late int op1, op2, op3;

  late int choosen;

  List<int> options = [];

  initState() {
    options.add(answer);
    options.add(o1);
    options.add(o2);

    options.shuffle();

    op1 = options.elementAt(0);
    op2 = options.elementAt(1);
    op3 = options.elementAt(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Take Quiz',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  '${number} X ${count} = ___',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                Column(
                  children: [
                    Text(
                      'Choose correct option',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            choosen = op1;

                            if (choosen == answer) {
                              Alert(
                                context: context,
                                type: AlertType.success,
                                desc: "Correct Answer",
                              ).show();
                            } else {
                              Alert(
                                context: context,
                                type: AlertType.error,
                                desc: "Wrong Answer",
                              ).show();
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 80,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.red),
                            child: Center(
                              child: Text(
                                '$op1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            choosen = op2;
                            if (choosen == answer) {
                              Alert(
                                context: context,
                                type: AlertType.success,
                                desc: "Correct Answer",
                              ).show();
                            } else {
                              Alert(
                                context: context,
                                type: AlertType.error,
                                desc: "Wrong Answer",
                              ).show();
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 80,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: Colors.red),
                            child: Center(
                              child: Text(
                                '$op2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            choosen = op3;
                            if (choosen == answer) {
                              Alert(
                                context: context,
                                type: AlertType.success,
                                desc: "Correct Answer",
                              ).show();
                            } else {
                              Alert(
                                context: context,
                                type: AlertType.error,
                                desc: "Wrong Answer",
                              ).show();
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 80,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.red,
                            ),
                            child: Center(
                              child: Text(
                                '$op3',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Container(
                        height: 100,
                        width: 140,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            'Generate New \n        Table',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Random random = Random();

                        count = random.nextInt(9) + 1;
                        answer = number * count;
                        o1 = random.nextInt(9) + 1 * number;
                        o2 = random.nextInt(9) + 1 * number;

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => quiz(
                                    number: number,
                                    count: count,
                                    answer: answer,
                                    o1: o1,
                                    o2: o2)));
                      },
                      child: Container(
                        height: 100,
                        width: 140,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            'Next Quiz',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
