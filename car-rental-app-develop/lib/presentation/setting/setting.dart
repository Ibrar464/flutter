import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/setting/setting_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  final SettingController _con = Get.put(SettingController());

  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
            leading: "back",
            action: true,
            text: "Settings",
            actionIcon: ImageConstant.notification),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                settingTitleList('Wallpapers'),
                settingList(
                    text: "Default",
                    func: () {
                      // Get.to(AboutusScreen());
                    },
                    child: const SizedBox()),
                settingTitleList('Common'),
                settingList(
                  text: "Language",
                  func: () {
                    Get.toNamed(AppRoutes.languageListScreen);
                  },
                  child: Row(
                    children: const [
                      Text(
                        'English',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                settingTitleList('Secutiry'),
                settingList(
                  text: "Notification",
                  func: () {},
                  child: Obx(
                    () => FlutterSwitch(
                      height: 25,
                      width: 50,
                      padding: 2,
                      value: _con.isnotification.value,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: const Color(0xffE4EEFB),
                      onToggle: (val) {
                        _con.isnotification.value = val;
                        if (val == true) {
                          Get.changeThemeMode(ThemeMode.dark);
                        } else {
                          Get.changeThemeMode(ThemeMode.light);
                        }
                      },
                    ),
                  ),
                ),
                settingList(
                    child: const SizedBox(),
                    text: "Chat setting",
                    func: () {
                      // Get.to(LanguageListScreen());
                    }),
                settingList(
                  text: "Change password",
                  func: () {
                    Get.toNamed(AppRoutes.changePasswordScreen);
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
                settingTitleList('Application'),
                settingList(
                  text: "Night mode",
                  func: () {},
                  child: Obx(
                    () => FlutterSwitch(
                      height: 25,
                      width: 50,
                      padding: 2,
                      value: _con.isDark.value,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: const Color(0xffE4EEFB),
                      onToggle: (val) {
                        _con.isDark.value = val;
                        if (val == true) {
                          Get.changeThemeMode(ThemeMode.dark);
                        } else {
                          Get.changeThemeMode(ThemeMode.light);
                        }
                      },
                    ),
                  ),
                ),
                settingList(
                    child: const SizedBox(),
                    text: "Help",
                    func: () {
                      // Get.to(AboutusScreen());
                    }),
                settingTitleList('Misc'),
                settingList(
                  text: "Terms of Service",
                  func: () {},
                  child: Obx(
                    () => FlutterSwitch(
                      height: 25,
                      width: 50,
                      padding: 2,
                      value: _con.ismisc.value,
                      inactiveColor: const Color(0xffE4EEFB),
                      activeColor: AppColors.primaryColor,
                      onToggle: (val) {
                        _con.ismisc.value = val;
                        if (val == true) {
                          Get.changeThemeMode(ThemeMode.dark);
                        } else {
                          Get.changeThemeMode(ThemeMode.light);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget settingList({
    String? text,
    Function()? func,
    Widget? child,
  }) {
    return GestureDetector(
      onTap: func,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.containerBorderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(text!), child!],
        ),
      ),
    );
  }

  Widget settingTitleList(text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      width: Get.width,
      child: Text(
        text!,
        style: TextStyle(color: AppColors.subTextColor),
      ),
    );
  }

  void emailLaunch(email, msg) async {
    try {
      final Uri _emailLaunchUri = Uri(
          scheme: 'mailto',
          path: '$email',
          queryParameters: {'subject': '$msg'});
      if (await canLaunch(_emailLaunchUri.toString())) {
        await launch(_emailLaunchUri.toString());
      } else {
        throw 'Could not launch ${_emailLaunchUri.toString()}';
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
