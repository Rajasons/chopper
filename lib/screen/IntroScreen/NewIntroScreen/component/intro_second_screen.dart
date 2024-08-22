import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/utils/constant.dart';

class IntroSecondScreen extends StatelessWidget {
  const IntroSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImage.intro2_image
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddVerticalSpace(30),
            Image.asset(
             AppImage.sub_intro2_image,
              height: 150.h,
            ),
            AddVerticalSpace(10),
            Text(
              "Check Fare & Book Ride".tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            AddVerticalSpace(10),
            Text(
              "Quickly view ride fares and book your ride with just one tap, all in one seamless process.".tr,
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
