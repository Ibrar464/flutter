

class ChatModel{
  String? id;
  String? sellerId;
  String? sellerName;
  String? userId;
  String? userName;

  ChatModel({this.id,this.sellerId,this.sellerName,this.userId,this.userName});

  factory ChatModel.fromMap(Map<dynamic, dynamic> map) {
    return ChatModel(
      id: map["id"],
      userId: map['userId'],
      userName: map['userName'],
      sellerId: map['sellerId'],
      sellerName: map['sellerName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId':userId,
      'userName': userName,
      'sellerName': sellerName,
      'sellerId': sellerId,
      'id': id,
    };
  }
}