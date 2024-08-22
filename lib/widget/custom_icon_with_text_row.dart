import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';

class CustomImageWithTextRow extends StatelessWidget {

  String? imageurl;
  String? text;
  Widget? trailingimage;
  double? imageurlheight;


  CustomImageWithTextRow({ this.imageurlheight ,this.trailingimage,this.imageurl, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddHorizontalSpace(20),
        Image.asset(imageurl ?? "",height: imageurlheight?.h ?? 20.h,fit: BoxFit.cover,),
        AddHorizontalSpace(20),
        Text(text ?? "",style: Black16w500,),
        Spacer(),
        trailingimage != null ? trailingimage! : SizedBox(),
      ],
    );
  }
}
