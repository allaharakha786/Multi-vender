// To parse this JSON data, do
//
//     final getAllJobsModel = getAllJobsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetAllJobsModel> getAllJobsModelFromJson(String str) => List<GetAllJobsModel>.from(json.decode(str).map((x) => GetAllJobsModel.fromJson(x)));

String getAllJobsModelToJson(List<GetAllJobsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllJobsModel {
  final int id;
  final String title;
  final String skillRequirements;
  final String address;
  final DateTime datePosted;
  final String jobDescription;
  var image;
  final String paymentType;
  final String amount;
  final String status;
  final int poster;
  var doer;
  final int jobCategory;

  GetAllJobsModel({
    required this.id,
    required this.title,
    required this.skillRequirements,
    required this.address,
    required this.datePosted,
    required this.jobDescription,
    required this.image,
    required this.paymentType,
    required this.amount,
    required this.status,
    required this.poster,
    required this.doer,
    required this.jobCategory,
  });

  factory GetAllJobsModel.fromJson(Map<String, dynamic> json) => GetAllJobsModel(
        id: json["id"],
        title: json["title"],
        skillRequirements: json["skill_requirements"],
        address: json["address"],
        datePosted: DateTime.parse(json["date_posted"]),
        jobDescription: json["job_description"],
        image: json["image"],
        paymentType: json["payment_type"],
        amount: json["amount"],
        status: json["status"],
        poster: json["poster"],
        doer: json["doer"],
        jobCategory: json["job_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "skill_requirements": skillRequirements,
        "address": address,
        "date_posted": datePosted.toIso8601String(),
        "job_description": jobDescription,
        "image": image,
        "payment_type": paymentType,
        "amount": amount,
        "status": status,
        "poster": poster,
        "doer": doer,
        "job_category": jobCategory,
      };
}
