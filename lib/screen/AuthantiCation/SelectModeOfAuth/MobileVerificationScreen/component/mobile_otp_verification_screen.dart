import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/view_model/MobileVerificationController/mobile_verification_controller.dart';
import '../../../../../constant/color.dart';
import '../../../../../utils/constant.dart';
import '../../../../../widget/custom_button.dart';

class MobileVerificationOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final mobileVerificationController = MobileVerificationController.instant;

    return Column(
      children: [
        AddVerticalSpace(10),
        Text(
          "enter_your_4-digit_code_otp.".tr,
          style: PrimaryGrey15w400,
        ),
        Text(
          "we've_sent_an_sms_with_the_OTP_to.".tr,
          style: PrimaryGrey15w400,
        ),
        AddVerticalSpace(20),
        OtpTextField(
          numberOfFields: 4,
          borderColor: AppColor.primaryGreyColor,
          cursorColor: Colors.black,
          focusedBorderColor: AppColor.primarytextfieldbackcolor,
          showFieldAsBox: true,
          filled: true,
          fillColor: AppColor.primaryGreyColor.withOpacity(0.2),
          onCodeChanged: (String code) {
            mobileVerificationController.isenable.value = true;
            print("code****************");
          },
          onSubmit: (String verificationCode) {
            mobileVerificationController.isenable.value = true;
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
          }, // end onSubmit
        ),
        AddVerticalSpace(30),
        Text(
          "resend_otp_in_27_seconds".tr,
          style: PrimaryGrey15w400,
        ),
        AddVerticalSpace(20),
        Obx(
          () => CustomButton(
            isload: mobileVerificationController.isload.value,
            backColor: mobileVerificationController.isenable.value == true
                ? AppColor.primaryryellowcolor
                : AppColor.primaryGreyColor,
            btnText: "continue".tr,
            onPressed: () {
              mobileVerificationController.mobileLoginAPi(context);
            },
          ),
        ),
      ],
    );
  }
}
