import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/view_model/WalletController/wallet_controller.dart';
import 'package:taxiuser/widget/custom_icon_with_text_row.dart';

import '../../../../constant/color.dart';
import '../../../../constant/textstyle.dart';
import '../../../../utils/constant.dart';
import '../../../../widget/custom_button.dart';

class WalletBottomSheet extends StatelessWidget {
  const WalletBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    final walletController = WalletController.instant;

    return  Obx(
        ()=>  walletController.isAddmoney.value == true ?
        Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp),
            topRight: Radius.circular(15.sp),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,left: 10.w,right: 10.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [
                AddVerticalSpace(20),
                Text(
                  "recharge_balance".tr,
                  style: Black18w500,
                ),
                AddVerticalSpace(20),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColor
                        .primaryrlightbluecolor,
                    borderRadius:
                    BorderRadius.circular(10.sp),
                    border: Border.all(
                        color: AppColor
                            .primaryBlueColor),
                  ),
                  child: Row(
                    children: [
                      AddHorizontalSpace(10),
                      Text("₹".tr, style: Black18w500),
                      AddHorizontalSpace(10),
                      Text("|".tr, style: PrimaryGrey25),
                      AddHorizontalSpace(10),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black),
                          keyboardType:
                          TextInputType.phone,
                          decoration: InputDecoration(
                            hintText:
                            "enter_amount_here".tr,
                            border: InputBorder.none,
                            enabledBorder:
                            InputBorder.none,
                            focusedBorder:
                            InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AddVerticalSpace(40),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                50),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "₹100".tr,
                          style: Black15,
                        )),
                    AddHorizontalSpace(20),
                    TextButton(
                        style: TextButton.styleFrom(
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                50),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "₹500".tr,
                          style: Black15,
                        )),
                    AddHorizontalSpace(20),
                    TextButton(
                        style: TextButton.styleFrom(
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                50),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "₹1000".tr,
                          style: Black15,
                        ),),
                  ],
                ),
                AddVerticalSpace(40),
                CustomButton(
                  btnText: "add_money".tr,
                  onPressed: () {
                    walletController.isAddmoney.value=false;
                  },
                ),
                AddVerticalSpace(20),
                Text(
                  "cancel".tr,
                  style: Primaryred18,
                ),
                AddVerticalSpace(10),
              ],
            ),
          ),
        ),
      ) : Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddVerticalSpace(30),
              Text("select_mode_of_payments".tr,style: Black18w500,),
              AddVerticalSpace(30),
              CustomImageWithTextRow(text: "paypal".tr,imageurl: AppImage.paypalimage,imageurlheight: 35,),
              AddVerticalSpace(20),
              CustomImageWithTextRow(text: "google_Pay".tr,imageurl: AppImage.goggleimage,imageurlheight: 35,),
              AddVerticalSpace(20),
              CustomImageWithTextRow(text: "card".tr,imageurl: AppImage.cardimage,imageurlheight: 35,),
              AddVerticalSpace(30),
              CustomButton(btnText: "+_add_new_account".tr, onPressed: () {
                Get.toNamed(RouteName.carddetails_screen);
              },),
              AddVerticalSpace(10),
            ],
          ),
        ),
    );
  }
}
