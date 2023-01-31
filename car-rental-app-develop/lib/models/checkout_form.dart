import 'availableCar_model.dart';

class CheckoutForm {


  String? username;
  String? address;
  String? country;
  String? city;
  int? days;
  String? phoneNo;
  int? isDriver;
  int? total;
  String? userid;
  String? carid;

  CheckoutForm({this.carid,this.userid, this.isDriver, this.phoneNo, this.total, this.username,
      this.address, this.days, this.city, this.country});

  Map<String, dynamic> toMap() {
    return {
      "userid":userid,
      "username": username,
      "address": address,
      "country": country,
      "city": city,
      "days": days,
      "phoneNo": phoneNo,
      "isDriver": isDriver,
      "total": total,
      "carid": carid
    };
  }

  factory CheckoutForm.fromMap(Map<dynamic, dynamic> map) {
    return CheckoutForm(
      userid: map["userid"],
        carid: map["carid"],
        isDriver:map["isDriver"],
        phoneNo:map["phoneNo"],
        total:map["total"],
        username:map["username"],
        address:map["address"],
        days:map["days"],
        city:map["city"],
        country:map["country"]);
  }

}