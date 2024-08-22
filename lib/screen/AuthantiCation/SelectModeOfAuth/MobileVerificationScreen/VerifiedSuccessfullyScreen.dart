import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/sharedpreference/shared_prefrences.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/widget/custom_button.dart';

class Verifiedsuccessfullyscreen extends StatefulWidget {
  const Verifiedsuccessfullyscreen({super.key});

  @override
  State<Verifiedsuccessfullyscreen> createState() => _VerifiedsuccessfullyscreenState();
}

class _VerifiedsuccessfullyscreenState extends State<Verifiedsuccessfullyscreen> {

@override
  void initState() {
    // TODO: implement initState
    SharedPrefrencesServices.getBearerToken().then((value) {
      print("${value}000000000000000000000000000000000000");
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AddVerticalSpace(50),
          Text("chopper_cab".tr,style: Black18w800,),
          AddVerticalSpace(100),
          Center(child: Image.asset(AppImage.doneimage,height: 130.h,)),
          AddVerticalSpace(20),
          Text("verified_successfully".tr,style: Black18w800,),
          Text("your_number_is_verified".tr,style: Black11w200,),
          AddVerticalSpace(20),
          CustomButton(btnText: "continue".tr, onPressed: (){

          },backColor: AppColor.primaryryellowcolor,)

        ],
      ),
    );
  }
}
