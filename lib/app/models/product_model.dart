// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.images,
    required this.description,
    required this.productDiscountStartDate,
    required this.size,
    required this.productDiscountPrice,
    required this.productDiscountEndDate,
    required this.price,
    required this.productColor,
    required this.name,
    required this.productDiscount,
    required this.itemAvailble,
    required this.category,
    required this.brand,
  });

  String image;
  List<String> images;
  String description;
  String productDiscountStartDate;
  String size;
  String productDiscountPrice;
  String productDiscountEndDate;
  String price;
  String productColor;
  String name;
  String productDiscount;
  String itemAvailble;
  String category;
  String brand;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json["image"],
        images: List<String>.from(json["images"].map((x) => x)),
        description: json["description"],
        productDiscountStartDate: json["productDiscountStartDate"],
        size: json["size"],
        productDiscountPrice: json["productDiscountPrice"],
        productDiscountEndDate: json["productDiscountEndDate"],
        price: json["price"],
        productColor: json["productColor"],
        name: json["name"],
        productDiscount: json["productDiscount"],
        itemAvailble: json["itemAvailble"],
        category: json["category"],
        brand: json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "images": List<dynamic>.from(images.map((x) => x)),
        "description": description,
        "productDiscountStartDate": productDiscountStartDate,
        "size": size,
        "productDiscountPrice": productDiscountPrice,
        "productDiscountEndDate": productDiscountEndDate,
        "price": price,
        "productColor": productColor,
        "name": name,
        "productDiscount": productDiscount,
        "itemAvailble": itemAvailble,
        "category": category,
        "brand": brand,
      };
}
