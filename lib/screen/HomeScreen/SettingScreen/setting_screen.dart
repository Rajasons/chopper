import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/LanguageController/language_controller.dart';
import 'package:taxiuser/widget/custom_button.dart';
import 'package:taxiuser/widget/custom_icon_with_text_row.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(text: "setting_drawer".tr,iconcolor: Colors.black,textcolor: Colors.black,backcolor: Colors.white.withOpacity(0.1)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            AddVerticalSpace(30),
            InkWell(
              onTap: () {
                Get.toNamed(RouteName.language_change_Screen);
              },
              child: CustomImageWithTextRow(
                imageurl: AppImage.changelanguageimage,
                imageurlheight: 15.h,
                text: "change_language".tr,
                trailingimage: Image.asset(AppImage.arrowimage,height: 13.h,),
                        ),
            ),
            AddVerticalSpace(20),
            CustomImageWithTextRow(
              imageurl: AppImage.changethemeimage,
              imageurlheight: 15.h,
              text: "change_theme".tr,
              trailingimage:  Obx(
                ()=> Switch(activeColor: Colors.black,value: languageController.isdarktheme.value, onChanged: (value) {
                  languageController.isdarktheme.value = value;

                },),
              ),
            ),
            AddVerticalSpace(20),
            InkWell(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AddVerticalSpace(30),
                        Text("After 30 days your account will be deleted permanently".tr,style:Black15w500,),
                        AddVerticalSpace(30),
                        CustomButton(btnText: "confirm".tr, onPressed: () {
                          Get.back();
                        },),
                        AddVerticalSpace(20),
                        CustomButton(btnText: "cancel".tr, onPressed: () {
                          Get.back();
                        },)
                      ],
                    ),
                  );
                },);
              },
              child: CustomImageWithTextRow(
                imageurl: AppImage.deleteimage,
                imageurlheight: 15.h,
                text: "delete".tr,
                trailingimage: Image.asset(AppImage.arrowimage,height: 13.h,),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
