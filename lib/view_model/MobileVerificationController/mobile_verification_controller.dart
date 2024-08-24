import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:taxiuser/data/network.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/sharedpreference/shared_prefrences.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/AuthController/auth_controller.dart';
import '../../data/url.dart';

class MobileVerificationController extends GetxController {


  static MobileVerificationController get instant => Get.find();

  final authController = AuthController.instant;
  TextEditingController mobilenumberController = TextEditingController();
  RxBool isenable = false.obs;
  RxBool isverification = false.obs;
  RxBool isload = false.obs;
  NetworkApi networkApi = NetworkApi();

  Future<void> mobileLoginAPi(BuildContext context) async {
    isload.value = true;
    var fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);

    await networkApi.postApi(
      url: Url.loginUrl,
      body: {
        "mobile": mobilenumberController.text,
        "device_token": fcmToken,
        "login_by": "android"
      },
    ).then(
      (value) async {
        if (value['success'] == false) {
          isload.value = false;
          authController.authscreenindex.value = 1;
          Get.offNamed(RouteName.auth_Screen);
          ErrorToast(
              Title: "Error", Message: value['message'], context: context);
        } else {
          isload.value = false;
          SharedPrefrencesServices.setBearerToken(value['access_token']);
          print("${value}2222222222222222222222222222222222222222222222");
          print("${value['access_token']}555555555555555555555555555555555");
          SuccessToast(
              Title: "Success",
              Message: 'Login Successfully',
              context: context);
          Get.offAllNamed(RouteName.home_Screen);
        }
      },
    );
  }
}
