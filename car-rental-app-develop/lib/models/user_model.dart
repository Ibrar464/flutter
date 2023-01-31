

class UserModel {
  String? id;
  String? image;
  String? name;
  String? email;
  bool? isSeller;
  String? mobile;

  UserModel({
    this.id,this.name,this.image,this.email,this.isSeller,this.mobile
  });

  Map<String, dynamic> toMap() {
    return {
      'mobile': mobile,
      'name':name,
      'email':email,
      'id':id,
      'image': image,
      'isSeller': isSeller,
    };
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> map) {
    return UserModel(
      isSeller: map['isSeller'],
      email: map['email'],
      id: map['id'],
      image: map['image'],
      name: map['name'],
      mobile:map['mobile']
    );
  }
}