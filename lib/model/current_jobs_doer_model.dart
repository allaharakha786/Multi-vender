import 'dart:convert';

List<CurrentJobsDoerModel> currentJobsDoerModelFromJson(String str) => List<CurrentJobsDoerModel>.from(json.decode(str).map((x) => CurrentJobsDoerModel.fromJson(x)));

String currentJobsDoerModelToJson(List<CurrentJobsDoerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrentJobsDoerModel {
  final int id;
  final String title;
  final String skillRequirements;
  final String address;
  final String jobDescription;
  final String amount;
  final String paymentType;
  final JobCategory jobCategory;
  final String status;
  final DateTime datePosted;
  final String icon;

  CurrentJobsDoerModel({
    required this.id,
    required this.title,
    required this.skillRequirements,
    required this.address,
    required this.jobDescription,
    required this.amount,
    required this.paymentType,
    required this.jobCategory,
    required this.status,
    required this.datePosted,
    required this.icon,
  });

  factory CurrentJobsDoerModel.fromJson(Map<String, dynamic> json) {
    return CurrentJobsDoerModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? '',
      skillRequirements: json["skill_requirements"] ?? '',
      address: json["address"] ?? '',
      jobDescription: json["job_description"] ?? '',
      amount: json["amount"] ?? '',
      paymentType: json["payment_type"] ?? '',
      jobCategory: json["job_category"] != null ? JobCategory.fromJson(json["job_category"]) : JobCategory(id: 0, name: '', icon: ''),
      status: json["status"] ?? '',
      datePosted: json["date_posted"] != null ? DateTime.parse(json["date_posted"]) : DateTime.now(),
      icon: json["icon"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "skill_requirements": skillRequirements,
        "address": address,
        "job_description": jobDescription,
        "amount": amount,
        "payment_type": paymentType,
        "job_category": jobCategory.toJson(),
        "status": status,
        "date_posted": datePosted.toIso8601String(),
        "icon": icon,
      };
}

class JobCategory {
  final int id;
  final String name;
  final String icon;

  JobCategory({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory JobCategory.fromJson(Map<String, dynamic> json) {
    return JobCategory(
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
