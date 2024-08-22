import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/widget/custom_icon_with_text_row.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(text: "support_drawer".tr,backcolor: Colors.white.withOpacity(0.0),textcolor: Colors.black,iconcolor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            AddVerticalSpace(50),
            InkWell(
              onTap: () {
                Get.toNamed(RouteName.chatwithus_screen);
              },
              child: CustomImageWithTextRow(
                imageurl: AppImage.cahtwithusimage,
                imageurlheight: 16.h,
                text: "chat_with_us".tr,
                trailingimage: Image.asset(AppImage.arrowimage,height: 15.h,),
              ),
            ),
            AddVerticalSpace(20),
            InkWell(
              onTap: () {
                Get.toNamed(RouteName.faq_screen);
              },
              child: CustomImageWithTextRow(
                imageurl: AppImage.faqimage,
                imageurlheight: 15.h,
                text: "faq".tr,
                trailingimage: Image.asset(AppImage.arrowimage,height: 15.h,),
              ),
            ),
            AddVerticalSpace(20),
            CustomImageWithTextRow(
              imageurl: AppImage.privacypolicyimage,
              imageurlheight: 20.h,
              text: "privacy_policy".tr,
              trailingimage: Image.asset(AppImage.arrowimage,height: 15.h,),
            ),
          ],
        ),
      ),
    );
  }
}
