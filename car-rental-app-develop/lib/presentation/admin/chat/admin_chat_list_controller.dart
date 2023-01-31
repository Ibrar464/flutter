import 'package:car_rental_app/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ChatMessageModel {
  final bool isMine;
  final String? message;
  final String? time;

  ChatMessageModel({this.isMine = false, this.message, this.time});
}

class AdminChatListController extends GetxController {



  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance;
  RxBool isLoading = false.obs;
  RxList chatsList = [].obs;

  RxList<ChatMessageModel> listSection = RxList([
    ChatMessageModel(
      message: "What is messages with chat features?",
      time: '12.35',
    ),
    ChatMessageModel(
      message: "Can I like a text on Samsung?",
      time: '12.36',
    ),
  ]);

  @override
  onInit() async {
    isLoading.value = true;

    await getChatList();

    isLoading.value = false;
    super.onInit();
  }

  getChatList() async {
    List<ChatModel> chats = [];

    var userid = firebaseAuth.currentUser!.uid;

    final snapshot = await databaseReference.ref("users")
        .child("$userid/chat")
        .get();

    if (snapshot.exists) {
      var data = snapshot.value as Map<dynamic,dynamic>;
      data.forEach((key, value) {
        chats.add(ChatModel.fromMap(value));
      });
    } else {
      print('No data available.');
    }

    chatsList.value= RxList(chats);
  }

}
