import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/screen/IntroScreen/component/horizontal_three_image.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/IntroController/intro_controller.dart';
import '../../../constant/color.dart';

class IntroBottomContainer extends StatelessWidget {

  final controller = IntroController.instant;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.primaryBlueColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(110.sp))),
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 10.w),
          child: Column(
            children: [
              AddVerticalSpace(20),
              HorizontalThreeImage(),
              AddVerticalSpace(70),
              Obx(
                () => controller.intropageindex.value == 0
                    ? Text(
                        "Welcome To *** taxi ride share service",
                        style: White25,
                      )
                    : controller.intropageindex.value == 1
                        ? Text(
                            "Get rides to great ride without the hassle",
                            style: White25,
                          )
                        : Text(
                            "Save time,save money and safe ride",
                            style: White22,
                          ),
              ),
              AddVerticalSpace(20),
              Text(
                "By comparing all the major ride options in one free app",
                style: White16,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.offNamed(RouteName.auth_Screen);
                    },
                    child: Text(
                      "skip".tr,
                      style: White22,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.intropageindex.value == 0) {
                        controller.intropageindex.value = 1;
                      } else if(controller.intropageindex == 2)
                        {
                            Get.offNamed(RouteName.auth_Screen);
                        }
                      else {
                        controller.intropageindex.value = 2;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImage.Skip,
                          scale: 0.90,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
