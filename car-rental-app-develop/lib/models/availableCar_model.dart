import 'dart:convert';

class Car {
  String? id;
  String? userid;
  String? image;
  String? brandName;
  String? model;
  bool? isAutomatic;
  bool? isDriver;
  String? bookedTime;
  String? seats;
  String? price;
  String? driverPrice;
  String? description;

  Car(
      {this.id,
      this.image,
      this.brandName,
      this.model,
      this.isAutomatic,
      this.seats,
      this.price,
      this.isDriver,
      this.driverPrice,
      this.description,
        this.userid,
      this.bookedTime});

  Map<String, dynamic> toMap() {
    return {
      'userid':userid,
      'description': description,
      'bookedTime': bookedTime,
      'driverPrice': driverPrice,
      'isDriver': isDriver,
      'id': id,
      'image': image,
      'brandName': brandName,
      'model': model,
      'isAutomatic': isAutomatic,
      'seats': seats,
      'price': price,
    };
  }

  factory Car.fromMap(Map<dynamic, dynamic> map) {
    return Car(
      description: map["description"],
      userid: map['userid'],
      bookedTime: map['bookedTime'],
      driverPrice: map['driverPrice'],
      isDriver: map['isDriver'],
      id: map['id'],
      image: map['image'],
      brandName: map['brandName'],
      model: map['model'],
      isAutomatic: map['isAutomatic'],
      seats: map['seats'],
      price: map['price'],
    );
  }

  // factory Car.fromObject(Object obj) {
  //   return Car(
  //     id: obj.id,
  //     image: obj['image'],
  //     brandName: obj['brandName'],
  //     model: obj['model'],
  //     isAutomatic: obj['isAutomatic'],
  //     seats: obj['seats'],
  //     price: obj['price'],
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));
}
