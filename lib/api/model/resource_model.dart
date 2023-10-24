// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductDetails welcomeFromJson(str) => ProductDetails.fromJson(json.decode(str));

String welcomeToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  String? shopName;
  String? address;
  List<String>? contacts;
  Coordinates? coordinates;
  List<ProductList>? productList;

  ProductDetails({
    this.shopName,
    this.address,
    this.contacts,
    this.coordinates,
    this.productList,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    shopName: json["shop_name"],
    address: json["address"],
    contacts: json["contacts"] == null ? [] : List<String>.from(json["contacts"]!.map((x) => x)),
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    productList: json["product_list"] == null ? [] : List<ProductList>.from(json["product_list"]!.map((x) => ProductList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "shop_name": shopName,
    "address": address,
    "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x)),
    "coordinates": coordinates?.toJson(),
    "product_list": productList == null ? [] : List<dynamic>.from(productList!.map((x) => x.toJson())),
  };
}

class Coordinates {
  String? lat;
  String? long;

  Coordinates({
    this.lat,
    this.long,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

class ProductList {
  String? name;
  List<String>? images;

  ProductList({
    this.name,
    this.images,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    name: json["name"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
  };
}
