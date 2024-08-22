import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/utils/constant.dart';

class CustomButton extends StatelessWidget {
  String btnText;
  final VoidCallback onPressed;
  double? height, width, fontsize;
  Color? backColor, fontcolor;
  Widget? image;
  bool? isload;

  CustomButton(
      {this.isload = false,
      this.fontcolor,
      this.backColor,
      this.image,
      this.fontsize,
      this.height,
      this.width,
      required this.btnText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h ?? 40.h,
      width: width?.w ?? 300.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backColor ?? AppColor.primaryryellowcolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) image! else SizedBox(),
            if (image != null) AddHorizontalSpace(5) else SizedBox(),
            Flexible(
              child: isload == false
                  ? Text(
                      btnText,
                      style: TextStyle(
                          color: fontcolor ?? Colors.black,
                          fontSize: fontsize?.sp ?? 18.sp),
                    )
                  : CircularProgressIndicator(
                      color: Colors.white,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
