import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/EmailVerificationScreen/component/create-password.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/EmailVerificationScreen/component/enter_mobile_number.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/EmailVerificationScreen/component/login.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/EmailVerificationScreen/component/ragistration.dart';
import '../../screen/AuthantiCation/SelectModeOfAuth/MobileVerificationScreen/component/mobile_otp_verification_screen.dart';


class AuthController extends GetxController{

  static AuthController get instant => Get.find();

  List<Widget> screen = [
    Login(),
    Ragistartion(),
    EnterMobileNumber(),
    MobileVerificationOtp(),
    CreatePassword(),
  ];

  RxInt authscreenindex = 0.obs;

}