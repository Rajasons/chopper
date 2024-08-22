import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/widget/custom_button.dart';
import 'package:taxiuser/widget/custom_text_field.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({super.key});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          text: "card_details".tr,
          backcolor: Colors.white.withOpacity(0.1),
          iconcolor: Colors.black,
          textcolor: Colors.black),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpace(10),
            Text(
              "enter_your_selected_card_details".tr,
              style: Black18w500,
            ),
            AddVerticalSpace(20),
            CustomTextField(hinttext: "card_number".tr),
            AddVerticalSpace(20),
            CustomTextField(hinttext: "card_holder_name".tr),
            AddVerticalSpace(20),
            Row(
              children: [
                Expanded(child: CustomTextField(hinttext: "MM/YY")),
                AddHorizontalSpace(20),
                Expanded(child: CustomTextField(hinttext: "CSV")),
              ],
            ),
            Spacer(),
            Center(
              child: CustomButton(
                btnText: "done".tr,
                onPressed: () {},
              ),
            ),
            AddVerticalSpace(10),
          ],
        ),
      ),
    );
  }
}
