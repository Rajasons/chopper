import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../constant/color.dart';
import '../../../../../constant/textstyle.dart';
import '../../../../../utils/constant.dart';
import '../../../../../view_model/AuthController/auth_controller.dart';
import '../../../../../widget/custom_button.dart';
import '../../../../../widget/header_text.dart';


class ForgetPasswordOtpVerification extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final authController = AuthController.instant;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if(didPop)
        {
          return ;
        }
        onwillPopScopeAuthScreen(2);
      },
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
            child: Column(children: [
              AddVerticalSpace(30),
              Center(
                  child: HeaderText(
                      text: "forget_password".tr,
                      textStyle: Black20)),
              AddVerticalSpace(30),
              Text(
                "Enter the verification code we just sent on your email address"
                    .tr,
                style: TextStyle(color: Colors.black),
              ),
              AddVerticalSpace(30),
              OtpTextField(
                numberOfFields: 4,
                borderColor: AppColor.primaryGreyColor,
                focusedBorderColor: AppColor.primaryBlueColor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  print("code****************");
                },
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content:
                          Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              AddVerticalSpace(50),
              CustomButton(
                btnText: "verify".tr,
                onPressed: () {
                  authController.authscreenindex.value=4;
                 // Get.toNamed(RouteName.createpassword_screen);
                },
              ),
              AddVerticalSpace(20),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "didn’t_received_code".tr,
                      style: TextStyle(
                          color: AppColor.primaryGreyColor,
                          fontSize: 14.sp),
                      children: [
                        TextSpan(
                          text: "resend".tr,
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.sp),
                        )
                      ]),
                ),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}
