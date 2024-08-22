import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/widget/custom_button.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          action: [Padding(
            padding:  EdgeInsets.only(right: 15.w),
            child: Icon(Icons.qr_code_scanner_sharp,color: Colors.black,),
          ),] ,
          text: "referral_drawer".tr,
          backcolor: Colors.white.withOpacity(0.0),
          iconcolor: Colors.black,
          textcolor: Colors.black),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpace(20),
            Text(
              "Refer a friend and earn ₹30".tr,
              style: Black18w500,
            ),
            AddVerticalSpace(20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColor.primaryrlightbluecolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "VWus2G",
                    style: PrimaryGrey15w400,
                  ),
                  Spacer(),
                  Icon(
                    Icons.copy,
                    color: AppColor.primaryGreyColor,
                  ),
                ],
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                if(snapshot.hasData)
                {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text("Satish"),
                        ),
                      );
                    },
                  );
                }
                else{
                  return Image.asset(AppImage.referaalnodataimage);
                }
              },
            )),
            Center(
              child: CustomButton(
                btnText: "Invite".tr,
                onPressed: () async {
                  await Share.share("dev");
                },
              ),
            ),
            AddVerticalSpace(10),
          ],
        ),
      ),
    );
  }
}
