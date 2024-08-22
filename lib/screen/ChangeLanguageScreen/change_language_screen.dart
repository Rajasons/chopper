import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/sharedpreference/shared_prefrences.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/LanguageController/language_controller.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {

  final languagecontroller = LanguageController.instant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("change_language".tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              SharedPrefrencesServices.setIsIntroVisible(true);
              Get.offNamed(RouteName.new_intro_screen);
            },
            icon: Image.asset(AppImage.Selectlanguageimage),
          ),
          AddHorizontalSpace(8),
        ],
      ),
      body: GridView.builder(
        itemCount: languagecontroller.language.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Obx(
            () => Container(
              margin: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  border: Border.all(
                    color :  languagecontroller.Selected_Language[index] == true
                        ? AppColor.primaryBlueColor
                        : Colors.grey.withOpacity(0.5),
                  ),),
              child: InkWell(
                onTap: () {
                  languagecontroller.selectedLanguage(index);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      languagecontroller.language[index]['imageUrl'],
                      scale: 0.6,
                    ),
                    AddVerticalSpace(10),
                    Text(
                      languagecontroller.language[index]['name'],
                      style: Black18w500,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
