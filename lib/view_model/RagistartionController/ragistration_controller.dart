import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:taxiuser/data/network.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/SplashController/splash_controller.dart';
import '../../data/url.dart';

class RagistrationController extends GetxController {

  static RagistrationController get instant => Get.find();
   final splashController = SplashController.instant;
  RxBool isPasswordContains = false.obs;
  RxBool isTermAndCondition = false.obs;
  RxString gender = "".obs;
  RxBool isload = false.obs;
  NetworkApi networkApi = NetworkApi();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  Future<void> ragistrationApi(BuildContext context) async {

    isload.value = true;
    var token = await FirebaseMessaging.instance.getToken();
    String fcm = token.toString();

    await networkApi.postApi(
        url: Url.ragisterUrl,
        body: jsonEncode({
          'name': nameController.text,
          'mobile': mobileNumberController.text,
          'password': passwordController.text,
          'email': emailController.text,
          'device_token': fcm,
          'country': 91,
          'login_by': splashController.platform.value,
          'lang': "English",
          'email_confirmed': 0,
          'gender': gender.value,
        }),
        header: {'Content-Type': 'application/json'}).then((value) {
        if (value['success'] == false) {
          isload.value = false;
          ErrorToast(Title: "Error", Message: value['message'], context: context);

        } else {

          isload.value = false;
          SuccessToast(Title: "Success", Message: "SuccessFully Registered", context: context);

        }
      },
    );
  }
}
