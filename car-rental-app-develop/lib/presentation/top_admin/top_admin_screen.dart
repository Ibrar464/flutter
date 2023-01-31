import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/top_admin/top_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../auth/logout/app_dialog.dart';

class TopAdmin extends StatelessWidget {
  TopAdmin({Key? key}) : super(key: key);

  final TopAdminController _con = Get.put(TopAdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "Home",
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _con.getUsers();
        },
        child: Obx(
          () => (!_con.isLoading.value)
              ? (_con.userList.isNotEmpty)
                  ? ListView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          ListView.builder(
                            itemCount: _con.userList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => TenantFormDetails(),));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 5,
                                            spreadRadius: 3,
                                            offset: const Offset(3, 3)),
                                      ],
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          alignment: Alignment.center,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Container(
                                              height: Get.height * .14,
                                              width: Get.height * .14,
                                              decoration: const BoxDecoration(
                                                color: Colors.amber,
                                              ),
                                              child: Image.network(
                                                (_con.userList[index].image!.isEmpty)?
                                                "https://static.toiimg.com/thumb/msid-68865435,width-800,height-600,resizemode-75,imgsize-179723,pt-32,y_pad-40/68865435.jpg":_con.userList[index].image!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      FittedBox(
                                                        child: Text(
                                                          _con.userList[index].name,
                                                          style: TextStyle(
                                                              fontSize: 18, color: Colors.black54),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              logoutDialog(
                                                                  context: Get.context,
                                                                  color: AppColors.primaryColor,
                                                                  description:
                                                                  "Are you sure you want to delete?",
                                                                  title: "Delete",
                                                                  buttonTitle: "Delete",
                                                                  onTap: () {
                                                                    _con.delete(_con.userList[index].id!);
                                                                    Get.back();
                                                                  });

                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                              size: 15,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Mobile : ",
                                                        style: TextStyle(
                                                            color:Colors.black),
                                                      ),
                                                      FittedBox(child:Text(
                                                        _con.userList[index].mobile,
                                                        style: TextStyle(
                                                            color:Colors.black54),
                                                      ) ,),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Email : ",
                                                        style: TextStyle(
                                                            color:Colors.black),
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          _con.userList[index].email,
                                                          style: TextStyle(
                                                              color:Colors.black54),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                  : ListView(children: [
                      SizedBox(
                        height: Get.height * 0.7,
                        child: Center(
                          child: Text("No User Yet"),
                        ),
                      ),
                    ])
              : SizedBox(
                  height: Get.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    );
  }
}
