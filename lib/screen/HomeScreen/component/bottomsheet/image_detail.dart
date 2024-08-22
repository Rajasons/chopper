import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/view_model/HomeController/home_controller.dart';
import '../../../../constant/color.dart';
import '../../../../constant/textstyle.dart';
import '../../../../utils/constant.dart';
import '../../../../widget/custom_button.dart';


class ImageDetail extends StatelessWidget {
  Widget? image;
  String? title;
  String? description;


  ImageDetail({this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    final homecontroller = HomeController.instant;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddVerticalSpace(20),
          Image.asset(
            homecontroller.imageDetail[homecontroller.imagedetailindex.value]['bottomsheetimage'],
            height: 50.h,
          ),
          AddVerticalSpace(10),
          Text(
            homecontroller.imageDetail[homecontroller.imagedetailindex.value]
                    ['vehicleName'] ??
                "",
            style: Black18w800,
          ),
          AddVerticalSpace(10),
          Text(
            homecontroller.imageDetail[homecontroller.imagedetailindex.value]
                    ['description'] ??
                "",
            style: Black15,
          ),
          AddVerticalSpace(20),
          Center(
            child: CustomButton(
              btnText: "close".tr,
              onPressed: () {
                Get.back();
              },
              backColor: AppColor.primaryryellowcolor,
            ),
          ),
          AddVerticalSpace(20),
        ],
      ),
    );
  }
}
