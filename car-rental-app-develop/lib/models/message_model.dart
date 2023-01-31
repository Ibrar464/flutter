class MessageModel{
  String? senderId;
  String? senderName;
  String? msg;

  MessageModel({this.senderName,this.senderId,this.msg});

  factory MessageModel.fromMap(Map<dynamic, dynamic> map) {
    return MessageModel(
      senderName: map["senderNmme"],
      senderId: map['senderId'],
      msg: map['msg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId':senderId,
      'senderName': senderName,
      'msg': msg,
    };
  }
}