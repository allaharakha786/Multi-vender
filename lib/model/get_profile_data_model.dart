// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  final String fullName;
  final dynamic address;
  final dynamic image;
  final String role;
  final dynamic skillTitle;

  GetProfileModel({
    required this.fullName,
    required this.address,
    required this.image,
    required this.role,
    required this.skillTitle,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
        fullName: json["full_name"],
        address: json["address"],
        image: json["image"],
        role: json["role"],
        skillTitle: json["skill_title"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "address": address,
        "image": image,
        "role": role,
        "skill_title": skillTitle,
      };
}
