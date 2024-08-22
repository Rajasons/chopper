import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiuser/view_model/AuthController/auth_controller.dart';
import '../../../../../constant/textstyle.dart';
import '../../../../../utils/constant.dart';
import '../../../../../widget/custom_button.dart';
import '../../../../../widget/custom_text_field.dart';
import '../../../../../widget/header_text.dart';


class EnterMobileNumber extends StatelessWidget {

  final _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final authController = AuthController.instant;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop){
        if(didPop){
          return;
        }
        onwillPopScopeAuthScreen(0);
      },
      child: Form(
        key: _globalkey,
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
              child: Column(
                children: [
                  AddVerticalSpace(30),
                  Center(
                      child: HeaderText(
                          text: "forget_password".tr,
                          textStyle: Black20)),
                  AddVerticalSpace(30),
                  Text(
                    "Don’t worry! it occurs Please enter the email address linked with your account.",
                    style: TextStyle(color: Colors.black),
                  ),
                  AddVerticalSpace(30),
                  CustomTextField(
                    title:"mobile_hinttext".tr ,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please_enter_mobile".tr;
                      } else if (!regexMobile.hasMatch(value)) {
                        return "please_enter_valid_mobile".tr;
                      } else if (value.length >= 11) {
                        return "please_enter_valid_mobile".tr;
                      } else {
                        return null;
                      }
                    },
                    hinttext: "mobile_hinttext".tr,
                    prefixIcon: Icon(Icons.phone),
                    keyboardType: TextInputType.phone,
                  ),
                  AddVerticalSpace(50),
                  CustomButton(
                    btnText: "send_otp".tr,
                    onPressed: () {
                      if (_globalkey.currentState!.validate()) {
                        authController.authscreenindex.value=3;
                        //Get.toNamed(RouteName.otpverification_screen);
                      } else {
                        ErrorToast(
                            Title: "error".tr,
                            Message: "please_enter_mobile".tr,
                            context: context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

}
