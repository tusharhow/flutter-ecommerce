// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.image,
    required this.description,
    required this.title,
  });

  String image;
  String description;
  String title;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        image: json["image"],
        description: json["description"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "description": description,
        "title": title,
      };
}
