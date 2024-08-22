import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/widget/custom_button.dart';
import 'package:taxiuser/widget/custom_icon_with_text_row.dart';
import 'package:taxiuser/widget/custom_text_field.dart';

import '../../../view_model/MakeComplaintController/make_complaint_controller.dart';

class MakeComplaintScreen extends StatefulWidget {
  const MakeComplaintScreen({super.key});

  @override
  State<MakeComplaintScreen> createState() => _MakeComplaintScreenState();
}

class _MakeComplaintScreenState extends State<MakeComplaintScreen> {
  MakeComplaintController makeComplaintController =
      Get.put(MakeComplaintController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: customAppbar(
            text: "make complaint_drawer".tr,
            iconcolor: Colors.black,
            textcolor: Colors.black,
            backcolor: Colors.white.withOpacity(0.0),
            iconButton: makeComplaintController.iscomplaint.value ? IconButton(onPressed: () {
              makeComplaintController.iscomplaint.value=false;
          } ,icon: Icon(Icons.arrow_back_ios_rounded)) : null,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddVerticalSpace(20),
                Text(
                  makeComplaintController.iscomplaint == false
                      ? "choose_your_complaint".tr
                      : makeComplaintController.MakeComplaintlist[
                          makeComplaintController.complaintType.value],
                  style: PrimaryGrey18w400,
                ),
                AddVerticalSpace(20),
                makeComplaintController.iscomplaint.value == false
                    ? Expanded(
                        child: ListView.builder(
                          itemCount:
                              makeComplaintController.MakeComplaintlist.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: InkWell(
                                    onTap: () {
                                      makeComplaintController.iscomplaint.value =
                                          true;
                                      makeComplaintController
                                          .complaintType.value = index;
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          makeComplaintController
                                              .MakeComplaintlist[index],
                                          style: Black15w400,
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: AppColor.primaryBlueColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: AppColor.primaryGreyColor,
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            hinttext:
                                "write your complaint here (minimun 10 character)".tr,
                            maxLines: 7,
                          ),
                            AddVerticalSpace(50),
                          Center(
                            child: CustomButton(btnText: "submit".tr, onPressed: () {
                              SuccessToast(Title: "done".tr, Message: "Thanks for letting us know".tr, context: context);
                              Future.delayed(Duration(seconds: 1),(){
                                makeComplaintController.iscomplaint.value=false;
                              },);


                            },),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
