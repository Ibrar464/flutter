import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/presentation/favorite/favorite_controller.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final FavoriteController _con = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: .68),
                  itemCount: _con.favoriteList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: Get.width / 2 - 20,
                      height: Get.height * .30,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.containerBorderColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Spacer(),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    _con.fav.value = !_con.fav.value;
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: AppColors.secondaryColor),
                                    child: Image.asset(
                                      ImageConstant.fav,
                                      color: _con.fav.value
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: Image.asset(
                              _con.favoriteList[index].image!,
                              fit: BoxFit.cover,
                              height: 75,
                              width: Get.width / 2 - 20,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _con.favoriteList[index].modelName!,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _con.favoriteList[index].year!,
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
                                    _con.favoriteList[index].gearType!,
                                    style: TextStyle(
                                        color: AppColors.subTextColor,
                                        fontSize: 10),
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
                                    _con.favoriteList[index].seats!,
                                    style: TextStyle(
                                        color: AppColors.subTextColor,
                                        fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "\$",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    _con.favoriteList[index].price!,
                                    style: const TextStyle(
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
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
