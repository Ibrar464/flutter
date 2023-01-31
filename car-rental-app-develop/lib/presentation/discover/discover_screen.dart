import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/discover/discover_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/availableCar_model.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({Key? key}) : super(key: key);
  final DiscoverController _con = Get.put(DiscoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // const SizedBox(height: 10),
                // _searchBox(),
                // const SizedBox(height: 10),
                // commonTitle(title: "Brands"),
                // brandCatagory(),
                const SizedBox(height: 10),
                (_con.rentedCarList.isNotEmpty)
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          commonTitle(
                              title: "Rented Cars",
                              func: () {
                                Get.toNamed(AppRoutes.availableCarsScreen);
                              }),
                          const SizedBox(height: 10),
                          ListView.builder(
                            itemCount: _con.rentedCarList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: availableCar(_con.rentedCarList[index]),
                              );
                            },
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 150,
                        child: Center(child: Text("No Car Ranted Yet")),
                      ),

                const SizedBox(height: 10),
                commonTitle(
                    title: "All Cars",
                    func: () {
                      Get.toNamed(AppRoutes.availableCarsScreen);
                    }),
                const SizedBox(height: 10),
                (!_con.isLoading.value)
                    ? (_con.availableCarList.length >= 2)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {

                                    Get.toNamed(AppRoutes.detailsScreen,
                                        arguments: {
                                          "id": _con.availableCarList[0].id,"isDetail":0
                                        });
                                  },
                                  child: carTile(_con.availableCarList[0])),
                              GestureDetector(
                                  onTap: () {

                                    Get.toNamed(AppRoutes.detailsScreen,
                                        arguments: {
                                          "id": _con.availableCarList[1].id,"isDetail":0
                                        });
                                  },
                                  child: carTile(_con.availableCarList[1])),
                            ],
                          )
                        : (_con.availableCarList.length == 1)
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.detailsScreen,
                                            arguments: {
                                              "id": _con.availableCarList[0].id,"isDetail":0
                                            });
                                      },
                                      child: carTile(_con.availableCarList[0]))
                                ],
                              )
                            : SizedBox(
                                height: 150,
                                child: Center(
                                  child: Text("No Car available"),
                                ),
                              )
                    : SizedBox(
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget availableCar(Car car) {
    return GestureDetector(
      onTap: () {
        Constants().id = car.id!;
        Get.toNamed(AppRoutes.detailsScreen, arguments: {"id": car.id,"isDetail":1});
      },
      child: Container(
        // padding: const EdgeInsets.only(left: 10),
        height: Get.height * .25,
        width: Get.width - 30,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.containerBorderColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              child: (car.image!.isEmpty)
                  ? Image.asset(
                      ImageConstant.fortunercar,
                      fit: BoxFit.cover,
                      width: Get.width / 2,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image(
                        image: CachedNetworkImageProvider(car.image!),
                        fit: BoxFit.fitWidth,
                        width: Get.width / 2,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                width: Get.width / 2 - 42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColors.secondaryColor),
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      car.brandName!,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      car.model!,
                      style: TextStyle(
                        color: AppColors.subTextColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(ImageConstant.car),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              (car.isAutomatic!) ? "Automatic" : "Manual",
                              style: TextStyle(
                                  color: AppColors.subTextColor, fontSize: 10),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Image.asset(ImageConstant.seat),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              car.seats!,
                              style: TextStyle(
                                  color: AppColors.subTextColor, fontSize: 10),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          "Rs.",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          car.price!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "/Day",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Spacer(),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        controller: _con.searchController,
        onSubmitted: (searchInfo) {},
        textAlign: TextAlign.start,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
            isDense: true,
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            ),
            prefixIcon: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.searchScreen);
                },
                child: Image.asset(ImageConstant.search)),
            focusColor: Colors.grey[400],
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1))),
      ),
    );
  }

  Widget commonTitle({String? title, Function()? func}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: func,
          child: Container(
            width: 60.0,
            alignment: Alignment.centerRight,
            child: const Text(
              "See all",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget brandCatagory() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
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
    );
  }

  Widget carTile(Car car) {
    return Container(
      width: Get.width / 2 - 20,
      height: Get.height * .30,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerBorderColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     const Spacer(),
          //     Obx(
          //       () => GestureDetector(
          //         onTap: () {
          //           _con.fav.value = !_con.fav.value;
          //         },
          //         child: Container(
          //           margin: const EdgeInsets.all(10),
          //           height: 30,
          //           width: 30,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(7),
          //               color: AppColors.secondaryColor),
          //           child: Image.asset(
          //             ImageConstant.fav,
          //             color: _con.fav.value
          //                 ? Colors.red
          //                 : Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          (car.image!.isEmpty)
              ? SizedBox(
                  child: Image.asset(
                    ImageConstant.fortunercar,
                    fit: BoxFit.fill,
                    height: 75,
                    width: Get.width / 2 - 20,
                  ),
                )
              : SizedBox(
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Image(
                      image: CachedNetworkImageProvider(car.image!),
                      fit: BoxFit.fitWidth,
                      width: Get.width / 2,
                    ),
                  ),
                ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              car.brandName!,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              car.model!,
              style: TextStyle(
                color: AppColors.subTextColor,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Image.asset(ImageConstant.car),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        (car.isAutomatic!) ? "Automatic" : "Manual",
                        style: TextStyle(
                            color: AppColors.subTextColor, fontSize: 10),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      Image.asset(ImageConstant.seat),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        car.seats!,
                        style: TextStyle(
                            color: AppColors.subTextColor, fontSize: 10),
                      )
                    ],
                  )
                ],
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Rs.",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                    FittedBox(
                      child: Text(
                        car.price!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Text(
                      "/Day",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Book Now",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
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
          color: Colors.white,
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
