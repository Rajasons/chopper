import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/AuthController/auth_controller.dart';
import 'package:taxiuser/view_model/SplashController/splash_controller.dart';
import 'package:taxiuser/widget/custom_button.dart';
import '../../../constant/color.dart';

class ContinueWithMobileScreen extends StatefulWidget {
  const ContinueWithMobileScreen({super.key});

  @override
  State<ContinueWithMobileScreen> createState() =>
      _ContinueWithMobileScreenState();
}

class _ContinueWithMobileScreenState extends State<ContinueWithMobileScreen> {

  SplashController splashController = Get.put(SplashController());
  AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddVerticalSpace(20),
              Image.asset(
                AppImage.app_logoimage,
                height: 130.h,
              ),
              AddVerticalSpace(20),
              Center(
                child: Image.asset(
                  AppImage.home_backimage,
                  height: 230.h,
                ),
              ),
              AddVerticalSpace(20),
              Text(
                "explore_new_ways_to_travel_with_chopper_cab".tr,
                style: Black16w800,
              ),
              AddVerticalSpace(20),
              Center(
                child: CustomButton(
                  fontsize: 14,
                  backColor: AppColor.primaryryellowcolor,
                  btnText: "continue_with_phone_number".tr,
                  onPressed: () {
                    Get.toNamed(RouteName.verification_screen);
                  },
                ),
              ),
              AddVerticalSpace(20),
              Center(
                child: CustomButton(
                  fontsize: 14,
                  btnText: "continue_with_email".tr,
                  onPressed: () {
                    Get.toNamed(RouteName.auth_Screen);
                  },
                ),
              ),
              AddVerticalSpace(30),
              Center(
                child: RichText(
                  text: TextSpan(
                      style: Black15,
                      text: 'by_continuing_you_agree_to_the'.tr,
                      children: [
                        TextSpan(
                            style: TextStyle(
                                color: AppColor.primaryredcolor,
                                fontSize: 15.sp),
                            text: 'user_agreement_&_privacy_policy'.tr)
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
