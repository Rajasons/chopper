import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List Faq = [
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
    "item6",
    "item7",
    "item8",
    "item9",
    "item10",
    "item11",
    "item12",
    "item13",
    "item14",
  ];

 String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white.withOpacity(0.0),
        title: Text("faq".tr),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            AddVerticalSpace(20),
            DropdownButtonFormField(
              icon: Icon(Icons.arrow_downward_outlined),
               decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primaryGreyColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: AppColor.primaryBlueColor),
                   borderRadius: BorderRadius.circular(20),
                 ),
               ),
              value: value,
              hint:Text("any_queries".tr,style: Black15,),
              items: Faq.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: Black15,),
                );
              }).toList(),
              onChanged: (value) {
                value=value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
