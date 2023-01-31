import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/chooseDateTime/choose_date_time_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
//     show CalendarCarousel;

class ChooseDateTimeScreen extends StatelessWidget {
  ChooseDateTimeScreen({Key? key}) : super(key: key);
  final ChooseDateTimeController _con = Get.put(ChooseDateTimeController());

  final DateTime _currentDate = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  // final DateTime _currentDate2 = DateTime(2019, 2, 3);
  // final String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  // final DateTime _targetDateTime = DateTime(2019, 2, 3);

  // ignore: unused_field
  static final Widget _eventIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: const Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: CalendarCarousel(
          //     onDayPressed: (date, events) {
          //       if (kDebugMode) {
          //         print(_con.selectedDay.value);
          //       }
          //       _con.selectedDay.value =
          //           DateTime(date.year, date.month, date.day);
          //     },
          //     weekendTextStyle: const TextStyle(
          //       color: Colors.black,
          //     ),
          //     headerTextStyle: const TextStyle(
          //         color: Colors.black,
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600),
          //     iconColor: const Color(0xff707070),
          //     headerTitleTouchable: true,
          //     thisMonthDayBorderColor: Colors.transparent,
          //     selectedDayBorderColor: AppColors.primaryColor,
          //     selectedDayButtonColor: AppColors.primaryColor,
          //     weekdayTextStyle: TextStyle(
          //         color: AppColors.primaryColor, fontWeight: FontWeight.w600),
          //     customDayBuilder: (
          //       bool isSelectable,
          //       int index,
          //       bool isSelectedDay,
          //       bool isToday,
          //       bool isPrevMonthDay,
          //       TextStyle textStyle,
          //       bool isNextMonthDay,
          //       bool isThisMonthDay,
          //       DateTime day,
          //     ) {},
          //     weekFormat: false,
          //     height: 420.0,
          //     selectedDateTime: _currentDate,
          //     daysHaveCircularBorder: false,
          //   ),
          // )
        ],
      ),
    );
  }
}
