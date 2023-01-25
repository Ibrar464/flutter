import 'package:get/get.dart';
import 'package:middddd/Firebase/user_controller.dart';



class UserServices extends GetxService {
  final UserController _userController = Get.put(UserController());

  Future<UserServices> init() async {
    await _userController.checkUserLogin().then((value) async {
      if(value){


        _userController.login.value=true;




      }
    });

    return this;
  }







}
