// To parse this JSON data, do
//
//     final jobsPostedModel = jobsPostedModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

JobsPostedModel jobsPostedModelFromJson(String str) => JobsPostedModel.fromJson(json.decode(str));

String jobsPostedModelToJson(JobsPostedModel data) => json.encode(data.toJson());

class JobsPostedModel {
  final int totalJobsPosted;
  final List<Job> jobs;

  JobsPostedModel({
    required this.totalJobsPosted,
    required this.jobs,
  });

  factory JobsPostedModel.fromJson(Map<String, dynamic> json) => JobsPostedModel(
        totalJobsPosted: json["total_jobs_posted"],
        jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_jobs_posted": totalJobsPosted,
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
      };
}

class Job {
  final int id;
  final String title;
  final String skillRequirements;
  final String jobCategory;
  final String address;
  final DateTime datePosted;
  final String jobDescription;
  final dynamic image;
  final String paymentType;
  final String amount;
  final int poster;

  Job({
    required this.id,
    required this.title,
    required this.skillRequirements,
    required this.jobCategory,
    required this.address,
    required this.datePosted,
    required this.jobDescription,
    required this.image,
    required this.paymentType,
    required this.amount,
    required this.poster,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        title: json["title"],
        skillRequirements: json["skill_requirements"],
        jobCategory: json["job_category"],
        address: json["address"],
        datePosted: DateTime.parse(json["date_posted"]),
        jobDescription: json["job_description"],
        image: json["image"],
        paymentType: json["payment_type"],
        amount: json["amount"],
        poster: json["poster"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "skill_requirements": skillRequirements,
        "job_category": jobCategory,
        "address": address,
        "date_posted": datePosted.toIso8601String(),
        "job_description": jobDescription,
        "image": image,
        "payment_type": paymentType,
        "amount": amount,
        "poster": poster,
      };
}
