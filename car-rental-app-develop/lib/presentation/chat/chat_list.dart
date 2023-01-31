import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/chat/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/utils/image_constant.dart';
import '../commonWidgets/app_bar.dart';
import 'chat_list_controller.dart';

class ChatList extends StatelessWidget {
  ChatList({Key? key}) : super(key: key);

  final ChatListController con = Get.put(ChatListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
          text: "Chat",
          actionIcon: ImageConstant.notification,
          action: true,
          leading: "back",
          onPressed: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Container(
              child: (!con.isLoading.value)?Padding(
                padding: const EdgeInsets.all(8.0),
                child: (con.chatsList.isNotEmpty)
                    ? ListView.builder(
                        itemCount: con.chatsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.chatScreen, arguments: {
                                "chat": con.chatsList[index].toMap()
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(33)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 70,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            alignment: Alignment.center,
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(30),
                                                ),
                                                child: Icon(
                                                  Icons.account_circle,
                                                  size: 50,
                                                )),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(con.chatsList[index].sellerName,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : SizedBox(
                        height: Get.height,
                        child: Center(child: Text("No Chat Found")),
                      ),
              ):SizedBox(
                height: Get.height,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ));
  }
}
