import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multi_vender/controllers/utils/apis_constants.dart';
import 'package:multi_vender/controllers/utils/my_shared_preference.dart';
import 'package:multi_vender/controllers/utils/snackbar.dart';
import 'package:multi_vender/model/current_jobs_doer_model.dart';
import 'package:multi_vender/model/doer_list_model.dart';
import 'package:multi_vender/model/get_all_category_list_model.dart';
import 'package:multi_vender/model/get_all_jobs_model.dart';
import 'package:multi_vender/model/get_profile_data_model.dart';
import 'package:multi_vender/model/jobs_posted_model.dart';
import 'package:multi_vender/model/recommendation_doer_jobs_model.dart';

class AuthApis {
  Future<bool> userSignupMethod({
    required bool isPoster,
    required String fullName,
    required String phoneNumber,
    required String userEmail,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl${isPoster ? posterSignupEp : doerSignupEp}");
    final headers = {"Content-Type": "application/json"};
    final encodedBody = jsonEncode({"full_name": fullName, "phone_number": phoneNumber, "email": userEmail, "password": password});
    final response = await http.post(url, headers: headers, body: encodedBody);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      await MySharedPreferences.setString(token, decodedBody['token']);

      // await MySharedPreferences.setBool('isLoggedIn', true);

      showSuccessSnackbar(decodedBody['message']);
      return true;
    } else {
      print('other response code');

      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      print(decodedBody);

      showErrorSnackbar("${decodedBody["message"]}");
      return false;
    }
  }

  Future<bool> verifyOtp({
    required String otpCode,
    required String userEmail,
  }) async {
    final url = Uri.parse("$baseUrl$verifyOtpEp");
    final headers = {"Content-Type": "application/json"};
    final encodedBody = jsonEncode({"email": userEmail, "code": otpCode});
    final response = await http.post(url, headers: headers, body: encodedBody);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> decodedBody = jsonDecode(response.body);

      showSuccessSnackbar(decodedBody['message']);
      return true;
    } else {
      print('other response code');
      print(response.statusCode);

      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      showErrorSnackbar("${decodedBody["error"]}");
      return false;
    }
  }

  Future<bool> loginMethod({
    required String email,
    required String Password,
  }) async {
    final url = Uri.parse("$baseUrl$loginEp");
    final headers = {"Content-Type": "application/json"};
    final encodedBody = jsonEncode({"email": email, "password": Password});
    final response = await http.post(url, headers: headers, body: encodedBody);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      await MySharedPreferences.setBool('isLoggedIn', true);
      await MySharedPreferences.setString(token, decodedBody['token']);
      var tokenn = await MySharedPreferences.getString(
        token,
      );

      print('Token is: $tokenn');

      showSuccessSnackbar(decodedBody['message']);
      return true;
    } else {
      print('other response code');
      print(response.statusCode);

      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      showErrorSnackbar("${decodedBody["non_field_errors"]}");
      return false;
    }
  }

  Future<bool> forgotPasswordMethod({
    required String email,
  }) async {
    final url = Uri.parse("$baseUrl$forgetPassword");
    final headers = {"Content-Type": "application/json"};
    final encodedBody = jsonEncode({
      "email": email,
    });
    final response = await http.post(url, headers: headers, body: encodedBody);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> decodedBody = jsonDecode(response.body);

      showSuccessSnackbar(decodedBody['message']);
      return true;
    } else {
      print('other response code');
      print(response.statusCode);

      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      showErrorSnackbar("${decodedBody["non_field_errors"]}");
      return false;
    }
  }

  Future<bool> verificationDocumentsUploadMethod({required String characterCertificatePath, required String nationalIdFrontPath, required String nationalIdBackPath}) async {
    var tokenn = await MySharedPreferences.getString(token);

    final url = Uri.parse("$baseUrl$uploadDocument");
    print('step1');

    Map<String, String> headers = {
      "User-Agent": "PostmanRuntime/7.43.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "token $tokenn",
    };

    var request = http.MultipartRequest("POST", url);
    request.headers.addAll(headers);

    characterCertificatePath.isEmpty ? null : request.files.add(await http.MultipartFile.fromPath('character_certificate', characterCertificatePath));
    nationalIdFrontPath.isEmpty ? null : request.files.add(await http.MultipartFile.fromPath('national_id_front', nationalIdFrontPath));
    nationalIdFrontPath.isEmpty ? null : request.files.add(await http.MultipartFile.fromPath('national_id_back', nationalIdBackPath));
    print('step2');

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print('step3');

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      showSuccessSnackbar(decodedBody['message']);
      return true;
    } else {
      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      showErrorSnackbar("${decodedBody}");
      print(response.statusCode);

      return false;
    }
  }

  Future<bool> updatingProfileMethod({required String imagePath, required String fullName, required String skillTitle, required String address}) async {
    var tokenn = await MySharedPreferences.getString(token);

    final url = Uri.parse("$baseUrl$profile");
    print('step1');

    Map<String, String> headers = {
      "User-Agent": "PostmanRuntime/7.43.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "token $tokenn",
    };

    var request = http.MultipartRequest("PATCH", url);
    request.headers.addAll(headers);

    imagePath.isEmpty ? null : request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    fullName.isEmpty ? null : request.fields['full_name'] = fullName;
    skillTitle.isEmpty ? null : request.fields['skill_title'] = skillTitle;
    address.isEmpty ? null : request.fields['address'] = address;

    print('step2');

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print('step3');

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      showSuccessSnackbar('Data Updated Sucessfully');
      return true;
    } else {
      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      showErrorSnackbar("${decodedBody}");
      print(response.statusCode);

      return false;
    }
  }

  Future getProfileDataMethod() async {
    try {
      var tokenn = await MySharedPreferences.getString(token);

      final url = Uri.parse("$baseUrl$profile");

      Map<String, String> headers = {
        "User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Authorization": "token $tokenn",
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = await getProfileModelFromJson(response.body);
        print(data.fullName);
        return data;
      } else {
        showErrorSnackbar('Something went wrong');
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
      print(e);
    }
  }

  Future getPostedJobsMethod() async {
    try {
      var tokenn = await MySharedPreferences.getString(token);

      final url = Uri.parse("$baseUrl$poster_jobs_list");

      Map<String, String> headers = {
        "User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Authorization": "token $tokenn",
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = await jobsPostedModelFromJson(response.body);
        print(data.jobs);
        return data;
      } else {
        showErrorSnackbar('Something went wrong');
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
      print(e);
    }
  }

  Future<bool> jobPostMethod({
    required String imagePath,
    required String skillRequirements,
    required String skillTitle,
    required String jobCategory,
    required String address,
    required String jobDescription,
    required String paymentType,
    required String amount,
  }) async {
    try {
      var tokenn = '12df382f8f2ba514982838d8c67f7a6d058a9a8d';

      if (tokenn == null || tokenn.isEmpty) {
        showErrorSnackbar("Authentication token is missing.");
        return false;
      }

      final url = Uri.parse("$baseUrl$jobs");

      print('Step 1: Preparing request');
      print('Image path: $imagePath');

      Map<String, String> headers = {
        "User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Authorization": "token $tokenn",
      };

      var request = http.MultipartRequest("POST", url);
      request.headers.addAll(headers);

      // Validate imagePath before adding it to the request
      if (imagePath.isNotEmpty) {
        try {
          request.files.add(await http.MultipartFile.fromPath('image', imagePath));
        } catch (e) {
          showErrorSnackbar("Failed to attach image: $e");
          return false;
        }
      } else {
        showErrorSnackbar("Image path is empty.");
        return false;
      }

      // Adding form fields
      request.fields.addAll({
        'payment_type': paymentType,
        'skill_requirements': skillRequirements,
        'title': skillTitle,
        'job_category': jobCategory,
        'address': address,
        'job_description': jobDescription,
        'amount': amount,
      });

      print('Step 2: Sending request');

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print('Step 3: Response received');

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          Map<String, dynamic> decodedBody = jsonDecode(response.body);
          showSuccessSnackbar('Data Updated Successfully');
          return true;
        } catch (e) {
          showErrorSnackbar("Failed to parse response: $e");
          return false;
        }
      } else {
        try {
          Map<String, dynamic> decodedBody = jsonDecode(response.body);
          showErrorSnackbar("${decodedBody}");
        } catch (e) {
          showErrorSnackbar("Unexpected error occurred.");
        }
        print("Error Status Code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      showErrorSnackbar("An error occurred: $e");
      return false;
    }
  }

  Future getAllJobsMethod() async {
    try {
      var tokenn = await MySharedPreferences.getString(token);

      final url = Uri.parse("$baseUrl$jobs");

      Map<String, String> headers = {
        "User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Authorization": "token 12df382f8f2ba514982838d8c67f7a6d058a9a8d",
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = await getAllJobsModelFromJson(response.body);
        print(data[0].address);
        return data;
      } else {
        showErrorSnackbar('Something went wrong, ${response.statusCode}');
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
      print(e);
    }
  }

  Future getCurrentDoerJobsMethod() async {
    try {
      var tokenn = await MySharedPreferences.getString(token);

      final url = Uri.parse("$baseUrl$doerCurrentJobs");

      Map<String, String> headers = {
        "User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Authorization": "token 06400230acc568497dc5ba5534ea0582894c6563",
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = await currentJobsDoerModelFromJson(response.body);
        print(data);
        return data;
      } else {
        showErrorSnackbar('Something went wrong, ${response.statusCode}');
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
      print(e);
    }
  }

  Future getRecommendedDoerJobsMethod() async {
    try {
      var tokenn = await MySharedPreferences.getString(token);

      final url = Uri.parse("$baseUrl$recommendedJobsForDoers");

      Map<String, String> headers = {
        "User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Authorization": "token 06400230acc568497dc5ba5534ea0582894c6563",
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = await recommendedJobsDoerModelFromJson(response.body);
        print(data);
        return data;
      } else {
        showErrorSnackbar('Something went wrong, ${response.statusCode}');
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
      print(e);
    }
  }

  Future getAllCategoryMethod() async {
    try {
      var tokenn = await MySharedPreferences.getString(token);

      final url = Uri.parse("$baseUrl$categoryList");

      Map<String, String> headers = {
        "User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Authorization": "token 06400230acc568497dc5ba5534ea0582894c6563",
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = await getCategoryListModelFromJson(response.body);
        print(data);
        return data;
      } else {
        showErrorSnackbar('Something went wrong, ${response.statusCode}');
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
      print(e);
    }
  }

  Future<bool> applyForJobMethod({
    required String amount,
    required String message,
    required int id,
  }) async {
    final url = Uri.parse("$baseUrl$jobsBids$id/");

    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded", // Change to form-data
      "User-Agent": "PostmanRuntime/7.43.0",
      "Accept": "*/*",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "token 06400230acc568497dc5ba5534ea0582894c6563",
      "Cookie": "csrftoken=FML0ljm7ksbAla0ZrrRmwqxTIvbKtgshm", // If required
    };

    // Encode form-data manually
    Map<String, String> body = {
      "amount": amount,
      "message": message,
    };

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print('Response Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      showErrorSnackbar("${decodedBody["non_field_errors"]}");
      return false;
    }
  }

  Future getAllDoersMethod() async {
    try {
      var tokenn = await MySharedPreferences.getString(token);

      final url = Uri.parse("$baseUrl$doerList");

      Map<String, String> headers = {
        "User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Authorization": "token 12df382f8f2ba514982838d8c67f7a6d058a9a8d",
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = await doerListModelFromJson(response.body);
        print(data);
        return data;
      } else {
        showErrorSnackbar('Something went wrong');
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
      print(e);
    }
  }
}
