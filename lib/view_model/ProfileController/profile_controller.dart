import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxiuser/data/network.dart';
import 'package:taxiuser/utils/constant.dart';
import '../../data/url.dart';
import '../../model/profile_data.dart';
import '../../sharedpreference/shared_prefrences.dart';

class ProfileController extends GetxController {

  static ProfileController get instance => Get.find();

  NetworkApi networkApi = NetworkApi();

  TextEditingController userNameController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController userMobileController = TextEditingController();
  RxString gender = "male".obs;
  RxBool isProfileEdit = true.obs;
  RxBool isload = false.obs;
  Rxn<File> userProfileUrl = Rxn<File>();

  static late UserProfileData userProfileData;

  Future<void> setProfileData() async {

    String token = await SharedPrefrencesServices.getBearerToken();
    await networkApi.getApi(url: Url.getProfileUrl, header: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).then(
      (value) async {

        userProfileData = UserProfileData.fromJson(value['data']);
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        var profileData = jsonEncode({
          "name": userProfileData.name,
          "email": userProfileData.email,
          "mobile": userProfileData.mobile,
          "gender": userProfileData.gender,
          "imageurl": userProfileData.profilePicture,
        });
        sharedPreferences.setString("profiledata", profileData);

      },
    );
  }

  Future<void> getProfileData() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = sharedPreferences.getString("profiledata") ?? "";
    var profiledata = jsonDecode(data);
    userNameController.text = profiledata['name'];
    useremailController.text = profiledata['email'];
    userMobileController.text = profiledata['mobile'];
    gender.value = profiledata['gender'];
    userProfileUrl.value  = profiledata['imageurl'] ?? "";
  }

  Future<void> updateProfileData(BuildContext context) async {
    isload.value = true;
    String token = await SharedPrefrencesServices.getBearerToken();
    print("${gender.value}2222222222222222222222222222222222222222");
    networkApi.postApi(url: Url.updateProfileUrl, body: jsonEncode({
      "email":useremailController.text,
      "name":userNameController.text,
      "gender":gender.value,
    }) ,header : {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).then((value) async {

        if(value['success'] == true){
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          print("${gender.value}2222222222222222222222222222222222222222");
          var profileData = jsonEncode({
            "name": userNameController.text,
            "email": useremailController.text,
            "mobile": userMobileController.text,
            "gender": gender.value,
          });
           sharedPreferences.setString("profiledata", profileData);
           getProfileData();
           SuccessToast(Title: "success".tr, Message: "profile_updated".tr, context: context);
           isload.value = false;
        }
    },);
  }

}
