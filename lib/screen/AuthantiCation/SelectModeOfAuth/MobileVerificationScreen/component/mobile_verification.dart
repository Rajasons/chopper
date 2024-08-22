import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiuser/view_model/MobileVerificationController/mobile_verification_controller.dart';
import '../../../../../constant/color.dart';
import '../../../../../utils/constant.dart';
import '../../../../../widget/custom_button.dart';
import '../../../../../widget/custom_text_field.dart';

class MobileVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final mobileVerificationController = MobileVerificationController.instant;
    final _globalkey = GlobalKey<FormState>();

    return Form(
      key: _globalkey,
      child: Column(
        children: [
          AddVerticalSpace(20),
          CustomTextField(
            controller: mobileVerificationController.mobilenumberController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value.isEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  mobileVerificationController.isenable.value = false;
                });
                return "please_enter_mobile".tr;
              } else if (value.length >= 11 || value.length <= 9) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  mobileVerificationController.isenable.value = false;
                });
                return "please_enter_valid_mobile".tr;
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  mobileVerificationController.isenable.value = true;
                });

                return null;
              }
            },
            hinttext: "0000000000".tr,
            maxlength: 10,
            prefixIcon: CountryCodePicker(
              mode: CountryCodePickerMode.dialog,
              onChanged: (country) {
              },
              initialSelection: 'IN',
              showFlag: true,
              showDropDownButton: false, // This will show the dropdown button// Adjust the flag size if needed// Remove padding if needed
              showCountryOnly: false,
              textStyle: TextStyle(color: Colors.black),// Only show the flag and dropdown button
              dialogTextStyle: TextStyle(color: Colors.black),
            ),
          ),
          AddVerticalSpace(40),
          Obx(
            () => CustomButton(
              backColor: mobileVerificationController.isenable.value == true
                  ? AppColor.primaryryellowcolor
                  : AppColor.primaryGreyColor,
              btnText: "continue".tr,
              onPressed: () {
                if (_globalkey.currentState!.validate() ) {

                    mobileVerificationController.isverification.value = true;
                    print(mobileVerificationController.isverification.value);

                } else {
                  ErrorToast(
                      Title: "error".tr,
                      Message: "please_enter_mobile".tr,
                      context: context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
