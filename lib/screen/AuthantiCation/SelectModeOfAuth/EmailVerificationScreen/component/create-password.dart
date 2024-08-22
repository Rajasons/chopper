import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constant/textstyle.dart';
import '../../../../../utils/constant.dart';
import '../../../../../view_model/AuthController/auth_controller.dart';
import '../../../../../widget/custom_button.dart';
import '../../../../../widget/custom_text_field.dart';
import '../../../../../widget/header_text.dart';

class CreatePassword extends StatelessWidget {

  TextEditingController passwordController = TextEditingController();
  final _globalkey = GlobalKey<FormState>();

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
        onwillPopScopeAuthScreen(3);
      },
      child: Form(
        key: _globalkey,
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
              child: Column(
                children: [
                  AddVerticalSpace(30),
                  Center(
                    child: HeaderText(
                        text: 'create_new_password'.tr,
                        textStyle: Black20),
                  ),
                  AddVerticalSpace(30),
                  Text(
                    "Your new password must be unique from those previously used"
                        .tr,
                    style: TextStyle(color: Colors.black),
                  ),
                  AddVerticalSpace(30),
                  CustomTextField(
                    title:"reset_password".tr ,
                    controller: passwordController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please_enter_password".tr;
                      } else if (!regexPassword.hasMatch(value)) {
                        return "please_enter_valid_password".tr;
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    hinttext: "reset_password".tr,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  AddVerticalSpace(30),
                  CustomTextField(
                    title: "confirm_password".tr,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please_enter_password".tr;
                      } else if (passwordController.text != value) {
                        return "both_are_not_same".tr;
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    hinttext: "confirm_password".tr,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  AddVerticalSpace(30),
                  Center(
                    child: CustomButton(
                      btnText: "reset_password".tr,
                      onPressed: () {
                        if (_globalkey.currentState!.validate()) {
                        } else {
                          ErrorToast(
                              Title: "Error",
                              Message: "please_fill_all_fields".tr,
                              context: context);}
                      },
                    ),
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
