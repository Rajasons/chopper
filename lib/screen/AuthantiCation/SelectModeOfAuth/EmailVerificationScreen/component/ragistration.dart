import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/view_model/AuthController/auth_controller.dart';
import 'package:taxiuser/view_model/RagistartionController/ragistration_controller.dart';
import 'package:taxiuser/widget/custom_button.dart';
import 'package:taxiuser/widget/custom_row.dart';
import 'package:taxiuser/widget/custom_text_field.dart';
import 'package:taxiuser/widget/header_text.dart';
import '../../../../../constant/textstyle.dart';
import '../../../../../utils/constant.dart';


class Ragistartion extends StatelessWidget {

  final _globalkey = GlobalKey<FormState>();


  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    final ragistrtionController = RagistrationController.instant;
    final authController = AuthController.instant;

    return Form(
      key: _globalkey,
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child:
                      HeaderText(text: "registration".tr, textStyle: Black20),
                ),
                AddVerticalSpace(15),
                CustomTextField(
                  title: "user_name_hinttext".tr,
                  controller: ragistrtionController.nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please_enter_username".tr;
                    } else {
                      return null;
                    }
                  },
                  hinttext: "user_name_hinttext".tr,
                  prefixIcon: Icon(Icons.person),
                ),
                AddVerticalSpace(15),
                CustomTextField(
                  title: "email_hinttext".tr,
                  controller: ragistrtionController.emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please_enter_email".tr;
                    } else if (!regexEmail.hasMatch(value)) {
                      return "please_enter_valid_email".tr;
                    } else {
                      return null;
                    }
                  },
                  hinttext: "email_hinttext".tr,
                  prefixIcon: Icon(Icons.email),
                ),
                AddVerticalSpace(15),
                CustomTextField(
                  title: "password_hinttext".tr,
                  controller: ragistrtionController.passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ragistrtionController.isPasswordContains.value = false;
                      });
                      return "please_enter_password".tr;
                    } else if (!regexPassword.hasMatch(value)) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ragistrtionController.isPasswordContains.value = true;
                      });
                      return "please_enter_valid_password".tr;
                    } else {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ragistrtionController.isPasswordContains.value = false;
                      });
                      return null;
                    }
                  },
                  hinttext: "password_hinttext".tr,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
                Obx(
                  () => Visibility(
                    visible: ragistrtionController.isPasswordContains.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddVerticalSpace(5),
                        Text(
                          "PassWord must be Contains : ",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          '* 8 characters long ',
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          "* one uppercase letter",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          "* one lowercase letter",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          "* one Special letter",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          "* one digit",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                AddVerticalSpace(15),
                CustomTextField(
                  title: "mobile_hinttext".tr,
                  controller: ragistrtionController.mobileNumberController,
                  keyboardType: TextInputType.phone,
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
                  hinttext: "0000000000".tr,
                  prefixIcon: CountryCodePicker(
                    mode: CountryCodePickerMode.dialog,
                    onChanged: (country) {
                    },
                    initialSelection: 'IN',
                    textStyle: Black15,
                    showFlag: true,
                    searchStyle: Black15,
                    dialogTextStyle: Black15,
                    showDropDownButton: false,
                  ),
                ),
                AddVerticalSpace(15),
                Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(vertical: 0.h),
                    child: Row(
                      children: [
                        Flexible(
                          child: RadioListTile(
                            visualDensity: VisualDensity(horizontal: -3.w),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 0.0),
                            value: "male",
                            groupValue: ragistrtionController.gender.value,
                            onChanged: (value) {
                              ragistrtionController.gender.value = value!;
                            },
                            title: Text(
                              "Male",
                              style: Black15,
                            ),
                          ),
                        ),
                        Flexible(
                          child: RadioListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 0.0),
                            value: "female",
                            groupValue: ragistrtionController.gender.value,
                            onChanged: (value) {
                              ragistrtionController.gender.value = value!;
                            },
                            title: Text(
                              "FeMale",
                              style: Black15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AddVerticalSpace(5),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: ragistrtionController.isTermAndCondition.value,
                        onChanged: (value) {
                          ragistrtionController.isTermAndCondition.value =
                              value!;
                        },
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: "i_agree_to_all".tr,
                          style: TextStyle(
                              color: AppColor.primaryGreyColor,
                              fontSize: 13.sp),
                          children: [
                            TextSpan(
                              text: "terms_and_condition".tr,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                AddVerticalSpace(30),
                Obx(
                  () => Center(
                    child: CustomButton(
                      isload: ragistrtionController.isload.value,
                      btnText: "sign_up".tr,
                      onPressed: () {
                        if (_globalkey.currentState!.validate() && ragistrtionController.isTermAndCondition.value) {
                          if(ragistrtionController.mobileNumberController.text.isEmpty){
                            ErrorToast(
                                Title: "error".tr,
                                Message: "please_fill_all_fields".tr,
                                context: context);
                          }
                          else
                            {
                              ragistrtionController.ragistrationApi(context);
                            }

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
                    )),
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
                AddVerticalSpace(20),
                CustomRow(
                  children: [
                    Image.asset(AppImage.goggleimage),
                    AddHorizontalSpace(30),
                    Image.asset(AppImage.appleimage),
                  ],
                ),
                AddVerticalSpace(10),
                Center(
                  child: InkWell(
                    onTap: () {
                      authController.authscreenindex.value = 0;
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "do_you_have_an_account".tr,
                        style: TextStyle(
                            color: AppColor.primaryGreyColor, fontSize: 14.sp),
                        children: [
                          TextSpan(
                            text: "login".tr,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AddVerticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


