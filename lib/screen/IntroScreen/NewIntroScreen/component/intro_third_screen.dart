import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/utils/constant.dart';

class IntroThirdScreen extends StatelessWidget {
  const IntroThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImage.intro3_image,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddVerticalSpace(30),
            Image.asset(
              AppImage.sub_intro3_image,
              height: 150.h,
            ),
            AddVerticalSpace(10),
            Text(
              "Enjoy Your Trip".tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            AddVerticalSpace(10),
            Text(
              "Sit back, relax, and have a great journey ahead!".tr,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
