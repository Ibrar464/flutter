import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3FFFF),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                  ),
                  child: Image.asset(
                    ImageConstant.congratulations,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Thank you! You're done.",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              Text(
                "TransRentals pick and drop service for\nintercity of intracity is the best.",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.trackYourCarScreen);
                },
                width: Get.width / 2,
                text: "Track Order",
              )
            ],
          ),
        ),
      ),
    );
  }
}
