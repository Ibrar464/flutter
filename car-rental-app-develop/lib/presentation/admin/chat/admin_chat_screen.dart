import 'package:car_rental_app/constants.dart';
import 'package:car_rental_app/core/app_export.dart';
import 'package:car_rental_app/models/chat_model.dart';
import 'package:car_rental_app/presentation/chat/chat_controller.dart';
import 'package:flutter/material.dart';

import 'admin_chat_controller.dart';

class AdminChatScreen extends StatefulWidget {
  AdminChatScreen({Key? key}) : super(key: key);

  @override
  State<AdminChatScreen> createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  final arguments = Get.arguments;
  late AdminChatController _con;
  late ChatModel chat;

  @override
  void initState() {
    chat = ChatModel.fromMap(arguments["chat"]);
    _con = Get.put(AdminChatController(chat));
    super.initState();
  }

  Widget chatListView() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: _con.chatsList.length,
        itemBuilder: (context, index) {
          return (_con.chatsList[index].senderId == Constants.userModel!.id)
              ? sentmessagewidget(
                  _con.chatsList[index].msg,
                  "",
                )
              : receivedMessagesWidget(
                  _con.chatsList[index].msg,
                  "",
                );
        },
      ),
    );
  }

  Widget sentmessagewidget(message, time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            time,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyText2!
                .apply(color: Colors.grey),
          ),
          const SizedBox(width: 15),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(Get.context!).size.width * 0.75),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.bodyText1!.apply(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget receivedMessagesWidget(message, time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(Get.context!).size.width * 0.75),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.bodyText1!.apply(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            time,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyText2!
                .apply(color: Colors.grey),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        titleSpacing: 0,
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 5),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      offset: const Offset(0, 2),
                      blurRadius: 5)
                ],
              ),
              child: Icon(
                Icons.account_circle,
                size: 30,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  chat.sellerName!,
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.clip,
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        // color: AppColors.primaryColor.withOpacity(0.4),
        child: Obx(
          () => (!_con.isLoading.value)
              ? Column(
                  children: [
                    (_con.chatsList.isNotEmpty)
                        ? chatListView()
                        : Expanded(
                            child: SizedBox(
                              height: Get.height,
                              child: Center(child: Text("No Message Found")),
                            ),
                          ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      height: 61,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35.0),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 5,
                                      color: Colors.grey)
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: TextField(
                                        controller:_con.textController,
                                        onChanged: (val) {
                                          _con.messageText.value = val;
                                        },
                                        onSubmitted: (String str) {
                                          _con.addMessage(str);
                                          _con.messageText.value = '';
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Type Something...",
                                            hintStyle: TextStyle(
                                                color: AppColors.subTextColor,
                                                fontWeight: FontWeight.w100,
                                                fontSize: 12),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Transform.scale(
                                      scale: 1,
                                      child: IconButton(
                                        icon: Image.asset(ImageConstant.send),
                                        onPressed: () {
                                          _con.addMessage(
                                              _con.messageText.value);
                                          _con.messageText.value = '';
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    (_con.errorText.value.isNotEmpty)
                        ? Text(
                            _con.errorText.value,
                            style: TextStyle(color: Colors.red),
                          )
                        : Text("")
                  ],
                )
              : SizedBox(
                  height: Get.height,
                  child: Center(child: CircularProgressIndicator()),
                ),
        ),
      ),
    );
  }
}
