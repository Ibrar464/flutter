import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_bar.dart';
import 'package:car_rental_app/presentation/commonWidgets/app_button.dart';
import 'package:car_rental_app/presentation/details/details_controller.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  final arguments = Get.arguments;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsController _con;
  int isDetail = 0;

  @override
  void initState() {

    _con = Get.put(DetailsController(id: widget.arguments['id']));
    setState(() {
      isDetail = widget.arguments["isDetail"];
    });
    _con.isLoading.value = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        text: "Details",
        actionIcon: ImageConstant.notification,
        action: true,
        leading: "back",
        onPressed: () {},
      ),
      body: Obx(
        () => (!_con.isLoading.value)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    (_con.car!.image!.isEmpty)
                        ? Container(
                            height: Get.height / 3,
                            width: Get.width,
                            color: Colors.amber,
                            child: Image.asset(
                              ImageConstant.fortunercar,
                            ))
                        : Container(
                            height: Get.height / 3,
                            width: Get.width,
                            color: Colors.amber,
                            child: Image(
                              image:
                                  CachedNetworkImageProvider(_con.car!.image!),
                              fit: BoxFit.cover,
                            )),
                    // const SizedBox(height: 10),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: List.generate(
                    //     2,
                    //     (index) =>
                    //         indicator(index, _con.currentCarouselIndex.value),
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              _con.car!.brandName ?? "Honda",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                            Text(
                              _con.car!.model ?? "2012",
                              style: TextStyle(
                                  color: AppColors.subTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            )
                          ],
                        ),
                        // Column(
                        //   children: [
                        //     RatingBar.builder(
                        //       unratedColor: Colors.grey,
                        //       itemSize: 20,
                        //       initialRating: 5,
                        //       minRating: 1,
                        //       direction: Axis.horizontal,
                        //       allowHalfRating: true,
                        //       itemCount: 5,
                        //       itemPadding:
                        //           const EdgeInsets.symmetric(horizontal: 4.0),
                        //       itemBuilder: (context, _) => const Icon(
                        //         Icons.star,
                        //         color: Colors.amber,
                        //       ),
                        //       onRatingUpdate: (rating) {},
                        //     ),
                        //     Text(
                        //       "4.0(70 Reviews)",
                        //       style: TextStyle(color: AppColors.subTextColor),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                    // const SizedBox(height: 20),
                    // commonTitle(title: "Car Features"),
                    // const SizedBox(height: 10),
                    // Row(children: [
                    //   ..._con.featuresList
                    //       .asMap()
                    //       .map((index, value) {
                    //         return MapEntry(
                    //             index,
                    //             Container(
                    //               margin: const EdgeInsets.all(4),
                    //               height: 50,
                    //               width: Get.width / 4 - 16,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(15),
                    //                   border: Border.all(
                    //                     color: AppColors.containerBorderColor,
                    //                   )),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //                 children: [
                    //                   Image.asset(
                    //                     _con.featuresList[index].image!,
                    //                     // height: 40,
                    //                     // width: 40,
                    //                   ),
                    //                   Text(
                    //                     _con.featuresList[index].label!,
                    //                     style: const TextStyle(
                    //                         color: Colors.black, fontSize: 10),
                    //                   )
                    //                 ],
                    //               ),
                    //             ));
                    //       })
                    //       .values
                    //       .toList(),
                    // ]),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Text(
                          "Info",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _con.car!.description ?? "",
                          style: TextStyle(
                              color: AppColors.subTextColor, fontSize: 12),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 20),
                    // Row(
                    //   children: const [
                    //     Text(
                    //       "Select your colour",
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 17.0,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     colorsbar(const Color(0xffDE5839), 0),
                    //     const Padding(padding: EdgeInsets.only(left: 2)),
                    //     colorsbar(const Color(0xff232D40), 1),
                    //     const Padding(padding: EdgeInsets.only(left: 2)),
                    //     colorsbar(Colors.white, 2),
                    //     const Padding(padding: EdgeInsets.only(left: 2)),
                    //     colorsbar(const Color(0xff455DFD), 3),
                    //   ],
                    // ),
                    Expanded(child: const SizedBox()),
                    Column(
                      children: [
                        (_con.car!.isDriver != null &&
                                _con.car!.isDriver == true)
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Rs. ",
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          _con.car!.driverPrice ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Text(
                                          "/Day with Driver",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Rs. ",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    _con.car!.price ?? "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Text(
                                    "/Day without Driver",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        (isDetail==0)?Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: AppButton(
                            width: Get.width * 0.9,
                            onPressed: () {
                              Get.toNamed(AppRoutes.checkoutScreen,
                                  arguments: {"car": _con.car!.toMap()});
                            },
                            text: "Book Now",
                          ),
                        ):SizedBox()
                      ],
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  indicator(int index,
      int value,) {
    return Obx(
          () => Container(
        height: 8,
        width: index == _con.currentIndex.value ? 20 : 8,
        margin: const EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(
            color: index == _con.currentIndex.value
                ? AppColors.primaryColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(4)),
      ),
    );
  }

  Widget commonTitle({String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: () => Get.toNamed(
            AppRoutes.seeAllScreen,
          ),
          child: Container(
            width: 60.0,
            alignment: Alignment.centerRight,
            child: const Text(
              "View all",
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

  Widget colorsbar(Color color, int index) {
    return Obx(
          () => GestureDetector(
        onTap: () {
          _con.isselected.value = index;
        },
        child: Container(
            height: 35,
            width: 35,
            child: Center(
                child: CircleAvatar(
                    radius: _con.isselected.value == index ? 14 : 11,
                    backgroundColor: color)),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                    color: _con.isselected.value == index
                        ? AppColors.primaryColor
                        : AppColors.secondaryColor,
                    width: 3))),
      ),
    );
  }
}
