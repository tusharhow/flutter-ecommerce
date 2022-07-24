// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
     required   this.name,
     required   this.email,
     required   this.password,
     required   this.city,
     required   this.address,
     required   this.mobileNumber,
     required   this.postalCode,
    });

    String name;
    String email;
    String password;
    String city;
    String address;
    String mobileNumber;
    String postalCode;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        city: json["city"],
        address: json["address"],
        mobileNumber: json["mobileNumber"],
        postalCode: json["postalCode"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "city": city,
        "address": address,
        "mobileNumber": mobileNumber,
        "postalCode": postalCode,
    };
}
