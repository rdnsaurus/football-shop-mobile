// To parse this JSON data, do
//
//     final itemEntry = itemEntryFromJson(jsonString);

import 'dart:convert';

ItemEntry itemEntryFromJson(String str) => ItemEntry.fromJson(json.decode(str));

String itemEntryToJson(ItemEntry data) => json.encode(data.toJson());

class ItemEntry {
    String id;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    int stock;
    dynamic user;

    ItemEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.stock,
        required this.user,
    });

    factory ItemEntry.fromJson(Map<String, dynamic> json) => ItemEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        stock: json["stock"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "stock": stock,
        "user": user,
    };
}
