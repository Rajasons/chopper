import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/screen/AuthantiCation/SelectModeOfAuth/MobileVerificationScreen/component/mobile_otp_verification_screen.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/MobileVerificationController/mobile_verification_controller.dart';
import '../../../../widget/custom_button.dart';
import '../EmailVerificationScreen/component/forget_password_otp_verification.dart';
import 'component/mobile_verification.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  MobileVerificationController mobileVerificationController = Get.put(MobileVerificationController());

  @override
  void initState() {
    // TODO: implement initState
    print(mobileVerificationController.isverification.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 18.h),
            color: Colors.black,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset("assets/lottie/gift.json", height: 50.h),
                  Flexible(
                    child: Text(
                      "sign-up_and_get_new_user_benefits".tr,
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        AddVerticalSpace(60),
                        Center(
                            child: Text(
                          "what's_your_number?".tr,
                          style: Black18w800,
                        ),),
                        AddVerticalSpace(20),
                        CircleAvatar(
                          radius: 60.sp,
                          backgroundColor: AppColor.primaryrlightyellowcolor,
                          child: Lottie.asset("assets/lottie/otpp.json",
                              height: 100.h),
                        ),
                       Obx(() => !mobileVerificationController.isverification.value
                           ? MobileVerification()
                           : MobileVerificationOtp(),),
                      ],
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
