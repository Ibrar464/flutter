import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:flutter/material.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          text: "Notification",
          leading: "back",
          action: true,
          actionIcon: ImageConstant.delete),
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (BuildContext context, int index) {
          return (friendsItem(index));
        },
      ),
    );
  }

  friendsItem(index) => Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.4,
              ),
              blurRadius: 1.20,
              offset: const Offset(0.5, 0.6),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (index % 3 == 0)
            //   const Text(
            //     'Today',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       color: Colors.grey,
            //       fontSize: 16.0,
            //     ),
            //   ),
            // if (index % 3 == 0) const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://i.pinimg.com/564x/46/98/38/4698388217d6af4a37829448164bdba6.jpg",
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lee sent you a message',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.grey : Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Commented: You gotta take Molly here. She wold love it! I assume this is near the Tennessee River or maybe.',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Get.isDarkMode
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.schedule, size: 18, color: AppColors.subTextColor),
                Text('  08:45 AM',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: AppColors.subTextColor)),
              ],
            ),
          ],
        ),
      );
}
