import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:middddd/Firebase/user_controller.dart';
import 'package:middddd/quizHistory.dart';
import 'package:middddd/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class quiz extends StatefulWidget { const quiz(
    {Key? key, this.number, this.count, this.answer, this.o1, this.o2,

    })
    : super(key: key);
  final number;
  final count;
  final answer;
  final o1;
  final o2;

  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
final controller=Get.put(UserController());
  late int number = widget.number;
  late int count = widget.count;
  late int answer = widget.answer;
  late int o1 = widget.o1;
  late int o2 = widget.o2;

  late int op1,op2,op3;

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
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context, MaterialPageRoute(builder: (context)=>
                    MyApp()));
              },
              child: Text(
                'Generate New Table',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
        ],
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData(
          color: Colors.yellow
        ),
      ),

      body: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Take Quiz',style: TextStyle(color: Colors.yellow, fontSize: 30,fontWeight: FontWeight.w900),),
              Divider(color: Colors.yellow,),
              Text('${number} X ${count} = ___',style: TextStyle(color: Colors.yellow, fontSize: 30,fontWeight: FontWeight.w900),),

              Column(
                children: [
                  Text('Choose one of them:',style: TextStyle(color: Colors.yellow, fontSize: 20,),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextButton(onPressed: (){
                        choosen = op1;
                        controller.saveData(question:'${number} X ${count} = ___',correct: choosen.toString() );

                        if(choosen == answer)
                        {
                          Alert(

                            context: context,
                            type: AlertType.success,
                            desc: "Correct Answer",

                          ).show();
                        }
                        else
                        {
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
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Colors.yellow
                            ),
                            child: Center(
                              child: Text(
                                  '$op1',style: TextStyle(color: Colors.black,fontSize: 20),
                              ),
                            )
                            ,
                          ),


                      ),
                      TextButton(onPressed: () {
                        choosen = op2;
                        controller.saveData(question:'${number} X ${count} = ___',correct: choosen.toString() );

                        if(choosen == answer)
                        {
                          Alert(
                            context: context,
                            type: AlertType.success,
                            desc: "Correct Answer",
                          ).show();
                        }
                        else
                        {
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
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Colors.yellow
                          ),
                          child: Center(
                            child: Text(
                              '$op2',style: TextStyle(color: Colors.black,fontSize: 20),
                            ),
                          )
                          ,
                        ),


                      ),
                      TextButton(onPressed: (){
                        choosen = op3;
                        controller.saveData(question:'${number} X ${count} = ___',correct: choosen.toString() );

                        if(choosen == answer)
                        {
                          print('yes');
                          Alert(
                            context: context,
                            type: AlertType.success,
                            desc: "Correct Answer",

                          ).show();
                        }
                        else
                        {
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
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Colors.yellow
                          ),
                          child: Center(
                            child: Text(
                              '$op3',style: TextStyle(color: Colors.black,fontSize: 20),
                            ),
                          )
                          ,
                        ),


                      ),


                    ],
                  ),
                ],
              ),
              Divider(color: Colors.yellow,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                      Get.to(()=>History());
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      child: Center(
                        child: Text(
                          'Quiz History',style: TextStyle(color: Colors.black,fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {
                      Random random =  Random();

                      count=random.nextInt(9)+1;
                      answer = number * count;
                      o1=random.nextInt(9)+1 * number;
                      o2=random.nextInt(9)+1 * number;

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                          quiz(number:number,count:count,answer:answer,o1:o1,o2:o2)));

                    },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      child: Center(
                        child: Text(
                          'Next Quiz',style: TextStyle(color: Colors.black,fontSize: 20),
                        ),
                      ),


                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),

            ],
          ),
        )


      ),

    );

  }

}