import 'dart:convert';

List<GetCategoryListModel> getCategoryListModelFromJson(String str) => List<GetCategoryListModel>.from(json.decode(str).map((x) => GetCategoryListModel.fromJson(x)));

String getCategoryListModelToJson(List<GetCategoryListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCategoryListModel {
  final int id;
  final String name;
  final String icon;

  GetCategoryListModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory GetCategoryListModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryListModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      icon: json["icon"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };
}
