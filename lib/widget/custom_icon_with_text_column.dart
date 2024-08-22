import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';

class CustomIconWithTextColumn extends StatelessWidget {
  String? imageurl;
  String? text;
  Color? backcolor;
  Widget? Icon;

  CustomIconWithTextColumn({this.Icon, this.backcolor, this.imageurl, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: this.backcolor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageurl ?? "",
                height: 30.h,
              ),
              AddHorizontalSpace(5),
              Icon != null ? Icon! : SizedBox(),
            ],
          ),
          AddVerticalSpace(5),
          Text(
            text ?? "",
            style: Black11w200,
          ),
        ],
      ),
    );
  }
}
