import 'package:get/get.dart';
import 'package:multi_vender/controllers/auth_apis/auth_apis.dart';
import 'package:multi_vender/controllers/utils/snackbar.dart';
import 'package:multi_vender/model/current_jobs_doer_model.dart' as current;
import 'package:multi_vender/model/doer_list_model.dart';
import 'package:multi_vender/model/get_all_category_list_model.dart';
import 'package:multi_vender/model/get_all_jobs_model.dart';
import 'package:multi_vender/model/get_profile_data_model.dart';
import 'package:multi_vender/model/jobs_posted_model.dart';
import 'package:multi_vender/model/recommendation_doer_jobs_model.dart' as recommended;

class AuthController extends GetxController {
  RxBool signUpLoading = false.obs;
  RxBool otpCodeLoading = false.obs;
  RxBool loginLoading = false.obs;
  RxBool profileLoading = false.obs;
  RxString imagePathh = ''.obs;

  Rx<GetProfileModel> profileDataList = GetProfileModel(fullName: '', address: null, image: null, role: '', skillTitle: null).obs;
  Rx<JobsPostedModel> jobsPosterDataList = JobsPostedModel(totalJobsPosted: 0, jobs: []).obs;
  RxList<current.CurrentJobsDoerModel> currentDoerJobsDataList =
      [current.CurrentJobsDoerModel(id: 0, title: '', skillRequirements: '', address: '', jobDescription: '', amount: '', jobCategory: current.JobCategory(icon: '', id: 0, name: ''), status: '', datePosted: DateTime.now(), icon: '', paymentType: '')].obs;

  RxList<GetCategoryListModel> getAllCategoryDataList = [GetCategoryListModel(id: 0, name: '', icon: '')].obs;

  RxList<DoerListModel> getAllDoerDataList = [DoerListModel(user: 0, fullName: '', address: '', image: '', role: '', skillTitle: '', categories: [])].obs;

  RxList<GetAllJobsModel> allJobsDataList = [GetAllJobsModel(id: 0, title: '', skillRequirements: '', address: '', datePosted: DateTime.now(), jobDescription: '', image: '', paymentType: '', amount: '', status: '', poster: 0, doer: 0, jobCategory: 0)].obs;

  RxList<recommended.RecommendedJobsDoerModel> recommendedJobsDoerDataList = [
    recommended.RecommendedJobsDoerModel(icon: '', paymentType: '', id: 0, title: '', skillRequirements: '', address: '', jobDescription: '', amount: '', jobCategory: recommended.JobCategory(id: 0, name: '', icon: ''), status: '', datePosted: DateTime.now()),
  ].obs;

  RxBool forgotPasswordLoading = false.obs;
  RxString idCardFront = "".obs;
  RxBool isDocumentVerificationLoading = false.obs;
  RxBool isPostJobLoading = false.obs;
  RxBool applyJobIsLoading = false.obs;

  RxBool isProfileUpdateLoading = false.obs;
  RxBool currentDoerJobLoading = false.obs;
  RxBool categoryListLoading = false.obs;

  RxBool getDoerLoading = false.obs;

  RxBool recommendedJobsDoerJobLoading = false.obs;

  RxString idCardBack = "".obs;
  RxString characterCertificate = "".obs;
  RxString postJobImage = "".obs;

  Future<bool> signUpUserController({required String fullName, required String email, required String password, required String phoneNumber, required bool isPoster}) async {
    try {
      signUpLoading.value = true;
      var userSigup = await AuthApis().userSignupMethod(fullName: fullName, userEmail: email, password: password, phoneNumber: phoneNumber, isPoster: isPoster);
      if (userSigup) {
        print('controller signup done');
        signUpLoading.value = false;

        return true;
      }
      signUpLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      signUpLoading.value = false;
      return false;
    }
  }

  Future<bool> verifyOtpController({required String email, required String otpCode}) async {
    try {
      otpCodeLoading.value = true;
      bool userSigup = await AuthApis().verifyOtp(userEmail: email, otpCode: otpCode);
      if (userSigup) {
        print('controller otp done');
        otpCodeLoading.value = false;

        return true;
      }
      otpCodeLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      otpCodeLoading.value = false;
      return false;
    }
  }

  Future<bool> loginController({required String email, required String password}) async {
    try {
      loginLoading.value = true;
      bool userSigup = await AuthApis().loginMethod(Password: password, email: email);
      if (userSigup) {
        print('controller login done');
        loginLoading.value = false;

        return true;
      }
      loginLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      loginLoading.value = false;
      return false;
    }
  }

  Future<bool> getProfileDataController() async {
    try {
      profileLoading.value = true;
      var userProfiledata = await AuthApis().getProfileDataMethod();
      print(userProfiledata);
      // if (userProfiledata != null) {
      //   print('get profile done');
      profileDataList.value = userProfiledata;
      //   profileLoading.value = false;

      //   return true;
      // }
      profileLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      profileLoading.value = false;
      return false;
    }
  }

  Future<bool> forgotPasswordController({required String email}) async {
    try {
      forgotPasswordLoading.value = true;
      bool userSigup = await AuthApis().forgotPasswordMethod(email: email);
      if (userSigup) {
        print('controller forgotPassword done');
        forgotPasswordLoading.value = false;

        return true;
      }
      forgotPasswordLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      forgotPasswordLoading.value = false;
      return false;
    }
  }

  Future<bool> documentVerificationController({required String characterCertificatePath, required String nationalIdFrontPath, required String nationalIdBackPath}) async {
    try {
      isDocumentVerificationLoading.value = true;
      bool documentVerfication = await AuthApis().verificationDocumentsUploadMethod(characterCertificatePath: characterCertificatePath, nationalIdFrontPath: nationalIdFrontPath, nationalIdBackPath: nationalIdBackPath);
      if (documentVerfication) {
        print('controller login done');
        isDocumentVerificationLoading.value = false;

        return true;
      }
      isDocumentVerificationLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      isDocumentVerificationLoading.value = false;
      return false;
    }
  }

  Future<bool> postJobController({required String jobTitle, required String skillRequirements, required String jobCategory, required String amount, required String paymentType, required String address, required String jobDescription, required String imagePath}) async {
    try {
      isPostJobLoading.value = true;
      bool documentVerfication = await AuthApis().jobPostMethod(
        address: address,
        amount: amount,
        imagePath: imagePath,
        jobCategory: jobCategory,
        jobDescription: jobDescription,
        paymentType: paymentType,
        skillRequirements: skillRequirements,
        skillTitle: jobTitle,
      );
      if (documentVerfication) {
        print('controller post job done');
        isPostJobLoading.value = false;

        return true;
      }
      isPostJobLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      isPostJobLoading.value = false;
      return false;
    }
  }

  Future<bool> updateProfileController({required String imagePath, required String address, required String fullName, required String skillTitle}) async {
    try {
      isProfileUpdateLoading.value = true;
      bool documentVerfication = await AuthApis().updatingProfileMethod(imagePath: imagePath, address: address, fullName: fullName, skillTitle: skillTitle);
      if (documentVerfication) {
        print('controller login done');
        isProfileUpdateLoading.value = false;

        return true;
      }
      isProfileUpdateLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      isProfileUpdateLoading.value = false;
      return false;
    }
  }

  Future<bool> getjobPosterController() async {
    try {
      isProfileUpdateLoading.value = true;
      var documentVerfication = await AuthApis().getPostedJobsMethod();
      if (documentVerfication == null) {
      } else {
        print('controller poster jobs done');
        jobsPosterDataList.value = documentVerfication;
        isProfileUpdateLoading.value = false;

        return true;
      }
      isProfileUpdateLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      isProfileUpdateLoading.value = false;
      return false;
    }
  }

  Future getAllJobsController() async {
    try {
      isProfileUpdateLoading.value = true;
      var allJobsMethod = await AuthApis().getAllJobsMethod();
      if (allJobsMethod == null) {
      } else {
        print('controller poster jobs done');
        allJobsDataList.value = allJobsMethod;
        print(allJobsDataList[0].address);
        isProfileUpdateLoading.value = false;

        return true;
      }
      isProfileUpdateLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      isProfileUpdateLoading.value = false;
      return false;
    }
  }

  Future getCurrentDoerJobs() async {
    try {
      currentDoerJobLoading.value = true;
      var currentDoerJobs = await AuthApis().getCurrentDoerJobsMethod();
      if (currentDoerJobs == null) {
      } else {
        print('controller current Doer jobs done');
        currentDoerJobsDataList.value = currentDoerJobs;
        print(currentDoerJobsDataList);
        currentDoerJobLoading.value = false;

        return true;
      }
      currentDoerJobLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      currentDoerJobLoading.value = false;
      return false;
    }
  }

  Future getAllCategoryListController() async {
    try {
      categoryListLoading.value = true;
      var currentDoerJobs = await AuthApis().getAllCategoryMethod();
      if (currentDoerJobs == null) {
      } else {
        print('controller current Doer jobs done');
        getAllCategoryDataList.value = currentDoerJobs;
        print(currentDoerJobsDataList);
        categoryListLoading.value = false;

        return true;
      }
      categoryListLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      categoryListLoading.value = false;
      return false;
    }
  }

  Future getAllDoerListController() async {
    try {
      getDoerLoading.value = true;
      var doerList = await AuthApis().getAllDoersMethod();
      if (doerList == null) {
      } else {
        print('controller current Doer jobs done');
        getAllDoerDataList.value = doerList;
        print(currentDoerJobsDataList);
        getDoerLoading.value = false;

        return true;
      }
      getDoerLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      getDoerLoading.value = false;
      return false;
    }
  }

  Future getRecommendedJobsDoersController() async {
    try {
      recommendedJobsDoerJobLoading.value = true;
      var recommendedDoerJobs = await AuthApis().getRecommendedDoerJobsMethod();
      if (recommendedDoerJobs == null) {
      } else {
        print('controller current Doer jobs done');
        recommendedJobsDoerDataList.value = recommendedDoerJobs;
        print(currentDoerJobsDataList.value);
        recommendedJobsDoerJobLoading.value = false;

        return true;
      }
      recommendedJobsDoerJobLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      recommendedJobsDoerJobLoading.value = false;
      return false;
    }
  }

  Future<bool> applyForJobController({required String amount, required String message, required int id}) async {
    try {
      applyJobIsLoading.value = true;
      bool applyjob = await AuthApis().applyForJobMethod(amount: amount, id: id, message: message);
      if (applyjob) {
        print('controller apply job doen');
        applyJobIsLoading.value = false;

        return true;
      }
      applyJobIsLoading.value = false;

      return false;
    } catch (e) {
      showErrorSnackbar("unexpected error occurred :${e.toString()}");
      applyJobIsLoading.value = false;
      return false;
    }
  }
}
