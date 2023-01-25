import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Firebase/user_controller.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  final controller=Get.put(UserController());
  @override
  void initState() {
    controller.getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz History", style: TextStyle(color: Colors.black, fontSize: 30,fontWeight: FontWeight.w900),),
        backgroundColor:  Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black54,
      body:Obx(() => controller.isLoading.value?Center(child: CircularProgressIndicator()): ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (context,index){
            return Card(

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Q#${index+1}: ${controller.list[index]['Question']}'),
                    Text("Ans:${controller.list[index]['correct answer']}"),
                  ],
                ),
              ),
            );


          })),
    );
  }
}
