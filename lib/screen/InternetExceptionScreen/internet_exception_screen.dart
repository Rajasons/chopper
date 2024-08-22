import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/SplashController/splash_controller.dart';
import '../../widget/custom_button.dart';

class InternetExceptionScreen extends StatefulWidget {
  @override
  State<InternetExceptionScreen> createState() => _InternetExceptionScreenState();
}

class _InternetExceptionScreenState extends State<InternetExceptionScreen> {
  @override
  Widget build(BuildContext context) {
 final   splashController = SplashController.instant;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Lottie.asset("assets/lottie/internetexception.json",
                  height: 250.h)),
          Center(
            child: Text(
              "seems there’s\ninternet connection".tr,
              style: Black15w400,
            ),
          ),
          AddVerticalSpace(10),
          Center(
            child: Text(
              "Please check your internet connection\nand try again.".tr,
              textAlign: TextAlign.center,
              style: PrimaryGrey15w400,
            ),
          ),
          AddVerticalSpace(20),
          Obx(
              ()=> CustomButton(
              btnText:"Retry".tr,
              isload: splashController.isLoad.value,
              onPressed: () {
                splashController.isLoad.value=true;
                Connectivity().checkConnectivity().then((value) {
                  if(value[0]==ConnectivityResult.wifi || value[0]==ConnectivityResult.mobile)
                  {
                    splashController.isLoad.value=false;
                    Get.back();
                  }
                  else
                  {
                    splashController.isLoad.value=false;
                    ErrorToast(Title: "error".tr, Message: "Please Check Your Internet Connection".tr, context: context);
                  }
                },);

              },
            ),
          ),
        ],
      ),
    );
  }
}
