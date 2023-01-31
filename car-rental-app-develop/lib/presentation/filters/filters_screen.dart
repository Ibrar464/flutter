import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/commonWidgets/comman_widgets.dart';
import 'package:car_rental_app/presentation/filters/filters_controller.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);
  final FilterController _con = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: appBar(
          text: "Ride Details",
          leading: "back",
          action: true,
          onPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commanTitle(text: "Brands"),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 4.0),
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        _brandList(image: _con.brandsList[index].image),
                    itemCount: _con.brandsList.length,
                    cacheExtent: 99,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
                commanTitle(text: "Vehicle Type"),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: List.generate(
                    _con.vehicleType.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _con.onSelectVehicle(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: _con.onSelectVehicleList.contains(index)
                              ? const Color(0xffF3FFFF)
                              : AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _con.onSelectVehicleList.contains(index)
                                ? AppColors.primaryColor
                                : AppColors.containerBorderColor,
                          ),
                        ),
                        child: Text(
                          _con.vehicleType[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: _con.onSelectVehicleList.contains(index)
                                ? AppColors.primaryColor
                                : AppColors.subTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                commanTitle(text: "Price Range"),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: List.generate(
                    _con.priceRange.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _con.onSelectPrice(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: _con.onSelectPriceList.contains(index)
                              ? const Color(0xffF3FFFF)
                              : AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _con.onSelectPriceList.contains(index)
                                ? AppColors.primaryColor
                                : AppColors.containerBorderColor,
                          ),
                        ),
                        child: Text(
                          _con.priceRange[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: _con.onSelectPriceList.contains(index)
                                ? AppColors.primaryColor
                                : AppColors.subTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                commanTitle(text: "Number of Seats"),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.containerBorderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: List.generate(
                      _con.numberOfSeats.length,
                      (index) => GestureDetector(
                        onTap: () {
                          _con.isSeatTap.value = index;
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              width: Get.width / 5 - 9.5,
                              margin: const EdgeInsets.all(1),
                              child: Text(
                                _con.numberOfSeats[index],
                                style: TextStyle(
                                  color: _con.isSeatTap.value == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: _con.isSeatTap.value == index
                                      ? AppColors.primaryColor
                                      : AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            if (_con.numberOfSeats.length - 1 == index ||
                                _con.isSeatTap.value == index ||
                                _con.isSeatTap.value - 1 == index)
                              const SizedBox()
                            else
                              Container(
                                height: 22,
                                width: 1.5,
                                color: AppColors.containerBorderColor,
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Sort by A-Z',
                        style: TextStyle(
                          color: AppColors.subTextColor,
                        ),
                      ),
                      trailing: Radio(
                        autofocus: true,
                        activeColor: AppColors.primaryColor,
                        value: 1,
                        groupValue: _con.isSelect.value,
                        onChanged: (value) {
                          _con.isSelect.value = int.parse(value.toString());
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Sort by Default',
                        style: TextStyle(
                          color: AppColors.subTextColor,
                        ),
                      ),
                      trailing: Radio(
                        activeColor: AppColors.primaryColor,
                        value: 2,
                        groupValue: _con.isSelect.value,
                        onChanged: (value) {
                          _con.isSelect.value = int.parse(value.toString());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: AppButton(
                    width: Get.width / 2,
                    text: "Set Filters",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _brandList({
    String? image,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.secondaryColor,
          border: Border.all(color: AppColors.containerBorderColor),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
            ),
          ],
        ),
        width: 100,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image!,
            )
          ],
        ),
      ),
    );
  }
}
