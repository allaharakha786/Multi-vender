import 'dart:convert';

List<DoerListModel> doerListModelFromJson(String str) => List<DoerListModel>.from(json.decode(str).map((x) => DoerListModel.fromJson(x)));

String doerListModelToJson(List<DoerListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoerListModel {
  final int user;
  final String fullName;
  final String address;
  final String image;
  final String role;
  final String skillTitle;
  final List<String> categories;

  DoerListModel({
    required this.user,
    required this.fullName,
    required this.address,
    required this.image,
    required this.role,
    required this.skillTitle,
    required this.categories,
  });

  factory DoerListModel.fromJson(Map<String, dynamic> json) {
    return DoerListModel(
      user: json["user"] ?? 0,
      fullName: json["full_name"] ?? '',
      address: json["address"] ?? '',
      image: json["image"] ?? '',
      role: json["role"] ?? '',
      skillTitle: json["skill_title"] ?? '',
      categories: json["categories"] != null ? List<String>.from(json["categories"].map((x) => x.toString())) : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user,
        "full_name": fullName,
        "address": address,
        "image": image,
        "role": role,
        "skill_title": skillTitle,
        "categories": List<dynamic>.from(categories.map((x) => x)),
      };
}
