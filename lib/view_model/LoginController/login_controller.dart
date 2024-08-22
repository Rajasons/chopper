import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:taxiuser/data/network.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/utils/constant.dart';
import '../../data/url.dart';
import '../../sharedpreference/shared_prefrences.dart';

class LoginController extends GetxController {

  static LoginController get instant => Get.find();
  NetworkApi networkApi = NetworkApi();
  RxBool isload = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginapi(BuildContext context) async {

    isload.value = true;
    await networkApi.postApi(url: Url.loginUrl, body: {
      "email": emailController.text,
      "password": passwordController.text,
    }).then(
      (value) {
        if (value['success'] == false) {
          isload.value = false;
          ErrorToast(
              Title: "Error", Message: value['message'], context: context);
        } else {
          SharedPrefrencesServices.setBearerToken(value['access_token']);
          isload.value = false;
          SuccessToast(
              Title: "Login", Message: "Login Successfully", context: context);
          Get.offAllNamed(RouteName.home_Screen);
        }
      },
    );
  }
}
