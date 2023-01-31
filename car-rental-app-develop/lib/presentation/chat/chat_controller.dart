import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/models/chat_model.dart';
import 'package:car_rental_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatMessageModel {
  final bool isMine;
  final String? message;
  final String? time;

  ChatMessageModel({this.isMine = false, this.message, this.time});
}

class ChatController extends GetxController {

  ChatModel chat;
  ChatController(this.chat);



  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance;
  RxString messageText = "".obs;
  RxString errorText = "".obs;
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

  TextEditingController textController = TextEditingController();

  @override
  onInit() async {
    isLoading.value = true;

    await getChatList();

    isLoading.value = false;
    super.onInit();
  }

  getChatList() async {
    List<MessageModel> msgList = [];

    final snapshot = await databaseReference.ref("chats")
        .child("${chat.id}/msg")
        .get();

    if (snapshot.exists) {
      var data = snapshot.value as Map<dynamic,dynamic>;
      data.forEach((key, value) {
        msgList.add(MessageModel.fromMap(value));
      });
    } else {
      print('No data available.');
    }

    chatsList.value= RxList(msgList);
  }

  addMessage(messageText) {
    if (messageText != null && messageText.isNotEmpty) {
      textController.text="";
      sendMessage(MessageModel(msg: messageText,senderId: Constants.userModel!.id,senderName: Constants.userModel!.name));

    } else {
      errorText.value ="Message is Empty";
    }

  }
  sendMessage(MessageModel msg) async {
    String?  msgKey = await databaseReference.ref("chats")
        .child("${chat.id}/msg")
        .push().key;

    final snapshot = await databaseReference.ref("chats")
        .child("${chat.id}/msg/"+msgKey!)
        .set(msg.toMap());

    getChatList();
  }

}
