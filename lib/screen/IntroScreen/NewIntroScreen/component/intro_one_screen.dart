import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/utils/constant.dart';

class IntroOneScreen extends StatelessWidget {
  const IntroOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImage.intro1_image
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddVerticalSpace(30),
            Image.asset(
              AppImage.sub_intro1_image,
              height: 150.h,
            ),
            AddVerticalSpace(10),
            Text(
              "Choose Your Destination".tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            AddVerticalSpace(10),
            Text(
              "Book your ride and get picked up by nearest driver as soon a possible.".tr,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  }
}
