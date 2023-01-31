import 'package:get/get.dart';

class ThankYouScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3)).then((val) {
      // Get.offAndToNamed(AppRoutes.bottombar);
    });
  }
}
