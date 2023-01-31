import 'package:car_rental_app/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomeController extends GetxController {
  RxInt currentCarouselIndex = 0.obs;
  CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  RxList<Welcome> welcomeList = RxList([
    Welcome(
      image: ImageConstant.splash1,
      title: "CHOOSE THE CAR YOU LIKE",
      subtitle:
          "We provide you with multiple Car booking options to choose from.",
    ),
    Welcome(
      image: ImageConstant.splash2,
      title: "MAKE PAYMENT AND CONCLUDE A CONTRACT",
      subtitle: "You can pay online or offline at your convenience.",
    ),
    Welcome(
      image: ImageConstant.splash3,
      title: "TAKE A TRIP BY CAR",
      subtitle:
          "With TransRentals, you can book a Car for local and outstation trips.",
    )
  ]);
}

class Welcome {
  String title;
  String subtitle;
  String? image;
  Welcome({required this.title, required this.subtitle, this.image});
}
