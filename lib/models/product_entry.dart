// To parse this JSON data, do
//
//     final newsEntry = newsEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> newsEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String newsEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    int id;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    bool isFeatured;
    String? brand;
    int stock;
    dynamic size;
    DateTime createdAt;
    DateTime updatedAt;
    int userId;
    String userUsername;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.brand,
        required this.stock,
        required this.size,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.userUsername,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        isFeatured: json["is_featured"],
        brand: json["brand"],
        stock: json["stock"],
        size: json["size"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        userUsername: json["user_username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "brand": brand,
        "stock": stock,
        "size": size,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
        "user_username": userUsername,
    };
}