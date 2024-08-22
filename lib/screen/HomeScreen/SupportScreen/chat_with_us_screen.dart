import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/widget/custom_text_field.dart';

class ChatWithUsScreen extends StatefulWidget {
  const ChatWithUsScreen({super.key});

  @override
  State<ChatWithUsScreen> createState() => _ChatWithUsScreenState();
}

class _ChatWithUsScreenState extends State<ChatWithUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppbar(text: "admin_chat".tr,textcolor: Colors.black,iconcolor: Colors.black,backcolor: Colors.white.withOpacity(0.0)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextField(hinttext: "enter_message".tr,suffixIcon: Icon(Icons.send,color: Colors.black,),),
            AddVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}
