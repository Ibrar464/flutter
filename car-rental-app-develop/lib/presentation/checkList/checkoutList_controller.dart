import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/availableCar_model.dart';
import 'package:car_rental_app/models/chat_model.dart';
import 'package:car_rental_app/models/checkout_form.dart';
import 'package:car_rental_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CheckoutListController extends GetxController {
  RxInt addressType = 0.obs;
  List addressList = ["Home", "Office", "Default"];
  RxBool isLoading=false.obs;

  final database = FirebaseDatabase.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  check(CheckoutForm checkoutForm, Car car) async{
    isLoading.value = true;

    UserModel? userModel;
    var snapshot = await database.child("users/"+car.userid!+"/userDetail").get();

    // map.forEach((key, value) {
    //   // final user = User.fromMap(value);
    //   print(value);
    //   // list.add(user);
    // });

    if(snapshot.value != null){
      final map = snapshot.value as Map<dynamic, dynamic>;
      userModel = UserModel.fromMap(map);
    }


    String exdate = DateTime.now().add(Duration(days: checkoutForm.days!)).toString();
    final key = database.push().key;

    String? chatid= await database.child("chats").push().key;

    ChatModel chat = ChatModel(id: chatid,sellerId: car.userid!,sellerName: userModel!.name,userId: firebaseAuth.currentUser!.uid,userName: Constants.userModel!.name);



    await database.child("chats/"+chatid!).set(chat.toMap());
    await database.child("users/"+firebaseAuth.currentUser!.uid+"/chat/"+chatid).set(chat.toMap());
    await database.child("users/"+car.userid!+"/chat/"+chatid).set(chat.toMap());

    await database.child("cars/"+car.id!).update({"bookedTime":exdate});
    await database.child("users/"+car.userid!+"/rentForms/"+key!).set(checkoutForm.toMap());

    car.bookedTime = exdate;

    await database.child("users/"+firebaseAuth.currentUser!.uid+"/rentedCar/"+car.id!).set(car.toMap());
    Get.offAllNamed(AppRoutes.bottomBarScreen);
    isLoading.value = false;
  }


}
