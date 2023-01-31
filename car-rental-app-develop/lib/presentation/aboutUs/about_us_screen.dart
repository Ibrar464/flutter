import 'package:car_rental_app/presentation/aboutUs/about_us_controller.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);
  final AboutUsController _con = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(leading: "back", text: "About Us"),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _con.aboutUsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return (privacyPolicyItem(index));
                }),
          ),
          AppButton(
            width: Get.width / 2,
            text: "Done",
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }

  privacyPolicyItem(index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _con.aboutUsList[index]['title'] != ''
                ? Text(
                    _con.aboutUsList[index]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? Colors.grey : Colors.black,
                      fontSize: 20.0,
                    ),
                  )
                : Container(),
            _con.aboutUsList[index]['title'] != ''
                ? const SizedBox(
                    height: 10,
                  )
                : Container(),
            _con.aboutUsList[index]['description'] != ''
                ? Text(
                    _con.aboutUsList[index]['description'],
                    style: TextStyle(
                        color:
                            Get.isDarkMode ? Colors.white24 : Colors.blueGrey,
                        fontSize: 16.0,
                        height: 1.5),
                  )
                : Container(),
          ],
        ),
      );
}
