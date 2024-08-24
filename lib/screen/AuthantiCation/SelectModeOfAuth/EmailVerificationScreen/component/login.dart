import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/view_model/AuthController/auth_controller.dart';
import 'package:taxiuser/view_model/LoginController/login_controller.dart';
import 'package:taxiuser/widget/custom_button.dart';
import 'package:taxiuser/widget/custom_row.dart';
import 'package:taxiuser/widget/custom_text_field.dart';
import 'package:taxiuser/widget/header_text.dart';
import '../../../../../constant/textstyle.dart';
import '../../../../../utils/constant.dart';

class Login extends StatelessWidget {

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final authcontroller = AuthController.instant;
    final logincontroller = LoginController.instant;

    return Form(
      key: _globalKey,
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AddVerticalSpace(20),
                Center(
                    child: HeaderText(
                        text: "login".tr, textStyle: Black20)),
                AddVerticalSpace(30),
                CustomTextField(
                  title: "email_hinttext".tr,
                  controller: logincontroller.emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please_enter_email".tr;
                    } else if (!regexEmail.hasMatch(value)) {
                      return "please_enter_valid_email".tr;
                    } else {
                      return null;
                    }
                  },
                  hinttext: "name_or_email_hinttext".tr,
                  prefixIcon: Icon(Icons.person),
                ),
                AddVerticalSpace(15),
                CustomTextField(
                  title: "password_hinttext".tr,
                  controller: logincontroller.passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please_enter_password".tr;
                    } else if (!regexPassword.hasMatch(value)) {
                      return "please_enter_valid_password".tr;
                    } else {
                      return null;
                    }
                  },
                  hinttext: "password_hinttext".tr,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
                AddVerticalSpace(5),
                InkWell(
                  onTap: () {
                    authcontroller.authscreenindex.value=2;
                    //Get.toNamed(RouteName.entermobile_screen);
                  },
                  child: Text(
                    "forgot_password_hinttext".tr,
                    style: TextStyle(
                        color: AppColor.primaryGreyColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                AddVerticalSpace(30),
                Obx(
                  ()=> Center(
                    child: CustomButton(
                      isload: logincontroller.isload.value,
                      btnText: "login".tr,
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                            logincontroller.loginapi(context);
                           // Get.offAllNamed(RouteName.home_Screen);
                        } else {
                          ErrorToast(
                              Title: "error".tr,
                              Message: "please_fill_all_fields".tr,
                              context: context);
                        }
                      },
                    ),
                  ),
                ),
                AddVerticalSpace(30),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColor.primaryGreyColor,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      "or".tr,
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                        child: Divider(
                      indent: 5,
                      color: AppColor.primaryGreyColor,
                    ))
                  ],
                ),
                AddVerticalSpace(30),
                CustomRow(
                  children: [
                    Image.asset(AppImage.goggleimage),
                    AddHorizontalSpace(30),
                    Image.asset(AppImage.appleimage),
                  ],
                ),
                AddVerticalSpace(20),
                Center(
                  child: InkWell(
                    onTap: () {
                      authcontroller.authscreenindex.value=1;
                      //Get.offNamed(RouteName.ragistration_screen);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "do_you_have_an_account".tr,
                        style: TextStyle(
                            color: AppColor.primaryGreyColor, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: "sign_up".tr,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AddVerticalSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
