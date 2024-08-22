import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiuser/view_model/HistoryController/history_controller.dart';

import '../../../constant/color.dart';
import '../../../constant/image.dart';
import '../../../constant/textstyle.dart';
import '../../../utils/constant.dart';

class HistoryContainer extends StatelessWidget {
  String fromtxt, destinationtxt, ruppestxt;

  HistoryContainer({required this.fromtxt, required this.destinationtxt, required this.ruppestxt});

  @override
  Widget build(BuildContext context) {
    final historyController = HistoryController.instant;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
        decoration: BoxDecoration(
            color: historyController.switcherIndex.value == 0
                ? AppColor.primaryrlightbluecolor
                : AppColor.primaryrlightcolor,
            border: Border.all(
              color: AppColor.primaryGreyColor,
              width: 1.0,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImage.fromimage,
                  height: 20.h,
                ),
                AddHorizontalSpace(20),
                Flexible(
                    child: Text(
                  fromtxt,
                  style: Black16w500,
                ))
              ],
            ),
            // Container(
            //   width: 22.w,
            //   alignment: Alignment.center,
            //   child: Image.asset(AppImage.dotsimage,),
            //
            // ),
            AddVerticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImage.destinationimage,
                  height: 25.h,
                ),
                AddHorizontalSpace(20),
                Flexible(
                    child: Text(
                  destinationtxt,
                  style: Black16w500,
                ))
              ],
            ),
            AddVerticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImage.history_rupees_image,
                  height: 20.h,
                ),
                AddHorizontalSpace(20),
                Flexible(
                  child: Text(
                    ruppestxt,
                    style: Black16w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
