// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<Product> productListFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productListToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String? id;
  String? name;
  Data? data;

  Product({
    this.id,
    this.name,
    this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
      };
}

class Data {
  String? color;
  String? capacity;
  String? capacityGB;
  int? year;
  String? price;
  String? cpuModel;
  String? hardDiskSize;

  Data({
    this.color,
    this.capacity,
    this.capacityGB,
    this.year,
    this.price,
    this.cpuModel,
    this.hardDiskSize,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        capacity: json["capacity"],
        capacityGB: json["capacity GB"],
        year: json["year"],
        price: json["price"],
        cpuModel: json["CPU model"],
        hardDiskSize: json["Hard disk size"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "capacity": capacity,
        "capacity GB": capacityGB,
        "year": year,
        "price": price,
        "CPU model": cpuModel,
        "Hard disk size": hardDiskSize,
      };
}
