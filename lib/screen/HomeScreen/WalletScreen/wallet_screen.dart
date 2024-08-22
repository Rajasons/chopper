import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/screen/HomeScreen/WalletScreen/component/wallet_bottom_sheet.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/WalletController/wallet_controller.dart';
import 'package:taxiuser/widget/custom_button.dart';
import 'package:taxiuser/widget/custom_text_field.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  WalletController walletController = Get.put(WalletController());
  TextEditingController addmoneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(
          text: "wallet_drawer".tr,
          backcolor: Colors.white.withOpacity(0.1),
          textcolor: Colors.black,
          iconcolor: Colors.black),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "available_balance".tr,
              style: Black18w500,
            ),
            AddVerticalSpace(20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.primaryrlightbluecolor,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Center(
                child: Text(
                  "₹0.00".tr,
                  style: Black16w500,
                ),
              ),
            ),
            AddVerticalSpace(20),
            Expanded(
              child: FutureBuilder(
                future: null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            trailing: Text(
                              "100",
                              style: Green12Op08,
                            ),
                            title: Text(
                              "Money Deposit By Admin",
                              style: Black15w500,
                            ),
                            subtitle: Text(
                              "29-10-2023",
                              style: Grey11,
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Image.asset(
                      AppImage.walletnodataimage,
                      height: 5,
                    );
                  }
                },
              ),
            ),
            //AddVerticalSpace(20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "recharge_balance".tr,
                    style: Black18w500,
                  ),
                  Text(
                    "here_you_can_top-up_your_wallet".tr,
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  AddVerticalSpace(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(context: context, builder: (context) {
                              return  WalletBottomSheet();
                              },);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImage.voucherlimage,
                                  height: 15,
                                  color: Colors.white,
                                ),
                                AddHorizontalSpace(10),
                                Text(
                                  "add_money".tr,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                        AddHorizontalSpace(10),
                        ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(context: context, builder: (context) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      child: Padding(
                                        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,left: 10.w,right: 10.w),
                                        child: Column(
                                          children: [
                                            AddVerticalSpace(20),
                                            CustomTextField(hinttext: "Enter Amount Here"),
                                            AddVerticalSpace(20),
                                            CustomTextField(hinttext: "Enter Amount Here"),
                                            AddVerticalSpace(40),
                                            CustomButton(btnText: "transfer_money".tr, onPressed: (){},),
                                            AddVerticalSpace(20),
                                            InkWell(onTap: () {
                                              Get.back();
                                            },child: Text("cancel".tr,style: Primaryred18,))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                              },);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImage.transfermoneyimage,
                                  height: 15,
                                  color: Colors.white,
                                ),
                                AddHorizontalSpace(10),
                                Text(
                                  "transfer_money".tr,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
