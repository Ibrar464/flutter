import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/admin/chat/admin_chat_list.dart';
import 'package:car_rental_app/presentation/admin/dashboard/admin_car_list_screen.dart';
import 'package:car_rental_app/presentation/admin/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants.dart';
import '../../auth/logout/app_dialog.dart';
import '../../commonWidgets/app_bar.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController con = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        child: ZoomDrawer(
          controller: con.zoomDrawerController,
          borderRadius: 24,
          style: DrawerStyle.Style1,
          openCurve: Curves.fastOutSlowIn,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.4,
              ),
              blurRadius: 1.20,
              offset: const Offset(0.5, 0.6),
            )
          ],
          disableGesture: true,
          mainScreenTapClose: true,
          slideWidth: Get.width * 0.75,
          duration: const Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          showShadow: false,
          angle: -8,
          clipMainScreen: true,
          mainScreen: Scaffold(
            appBar: con.pageIndex.value == 0
                ? appBar(
                    onTap: () {
                      con.zoomDrawerController.toggle!();
                    },
                    action: true,
                    leading: "menu",
                    text: "Home",
                  )
                : appBar(
                    text: "Chats",
                  ),
            body: con.pageIndex.value == 0
                ? AdminCarListScreen()
                : con.pageIndex.value == 1
                    ? AdminChatList()
                    : AdminCarListScreen(),
            bottomNavigationBar: bottombar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addCarScreen);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          menuScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: Get.height * .08,
                        width: Get.height * .08,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Image.network(
                          (Constants.userModel!.image!.isEmpty)
                              ? "https://static.toiimg.com/thumb/msid-68865435,width-800,height-600,resizemode-75,imgsize-179723,pt-32,y_pad-40/68865435.jpg"
                              : Constants.userModel!.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Constants.userModel!.name!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.editProfileScreen);
                          },
                          child: Row(
                            children: [
                              Text(
                                "Edit profile",
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                ImageConstant.edit,
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    color: AppColors.containerBorderColor,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: Get.width / 1.7,
                    child: ListView.builder(
                        itemCount: con.drawerList.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => GestureDetector(
                              onTap: () {
                                con.drawer.value = index;
                                logoutDialog(
                                    context: Get.context,
                                    color: AppColors.primaryColor,
                                    description:
                                        "Are you sure you want to log out?",
                                    title: "log out?",
                                    buttonTitle: "Log Out",
                                    onTap: () {
                                      con.logOut();
                                    });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: con.drawer.value == index
                                        ? AppColors.primaryColor
                                        : AppColors.secondaryColor),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      con.drawerList[index][1],
                                      color: con.drawer.value == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      con.drawerList[index][0],
                                      style: TextStyle(
                                        color: con.drawer.value == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.chevron_right,
                                      color: con.drawer.value == index
                                          ? Colors.white
                                          : AppColors.containerBorderColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                // Container(
                //   width: Get.width / 1.5,
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 16, vertical: 15),
                //   margin: const EdgeInsets.only(bottom: 20),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: const Color(0xffDBF0F1)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Image.asset(ImageConstant.wallet),
                //       Column(
                //         children: [
                //           const Text(
                //             "Wallet balance",
                //             style:
                //                 TextStyle(color: Colors.black, fontSize: 12),
                //           ),
                //           Text(
                //             "\$ 1200.00",
                //             style: TextStyle(
                //                 color: AppColors.primaryColor,
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w500),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bottombar() {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 70,
      width: Get.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.4,
            ),
            blurRadius: 1.20,
            offset: const Offset(0.5, 0.6),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          con.icons.length,
          (index) => Obx(
            () => IconButton(
              onPressed: () {
                con.pageIndex.value = index;
              },
              icon: Image.asset(
                con.pageIndex.value == index
                    ? con.icons[index][1]
                    : con.icons[index][0],
                height: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
