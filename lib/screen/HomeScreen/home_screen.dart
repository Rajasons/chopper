import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/image.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/screen/HomeScreen/component/google_map.dart';
import 'package:taxiuser/screen/HomeScreen/component/home_screen_bottom_content.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/HomeController/home_controller.dart';
import 'package:taxiuser/view_model/ProfileController/profile_controller.dart';
import 'package:taxiuser/widget/custom_icon_with_text_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  ProfileController profileController = Get.put(ProfileController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    profileController.setProfileData().then(
      (value) {
        print("${ProfileController.userProfileData.id}===========================id");
      },
    );
    ever(homeController.bottonSheetIndex, (_) {
      if (homeController.bottonSheetIndex.value >= 0 &&
          homeController.bottonSheetIndex.value <
              homeController.bottomSheetClass.length) {
        homeController.bottomSheet(Get.context!);
      } else {
        homeController.bottonSheetIndex.value = -1; // Reset invalid index immediately.
      }
    });

    // void resetBottonSheetIndex() {
    //   ever(homeController.bottonSheetIndex, (_) {}).dispose(); // Disable the listener
    //   homeController.bottonSheetIndex.value = -1;
    //   Future.delayed(Duration(milliseconds: 200), () {
    //     // Re-enable the listener after the index is reset
    //     ever(homeController.bottonSheetIndex, (_) {
    //       if (homeController.bottonSheetIndex.value >= 0 &&
    //           homeController.bottonSheetIndex.value < homeController.bottomSheetClass.length) {
    //         homeController.bottomSheet(Get.context!);
    //       }
    //     });
    //   });
    // }
    // resetBottonSheetIndex();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImage.drawercarimage),
                        fit: BoxFit.cover)),
              ),
              AddVerticalSpace(20),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    RouteName.history_Screen,
                  );
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.historyimage,
                  text: "history_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.notification_Screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.notificationimage,
                  text: "notification_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.history_Screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.outstationimage,
                  text: "outstation_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.wallet_Screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.walletimage,
                  text: "wallet_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.sos_screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.sosimage,
                  text: "sos_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.make_complaint_screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.makecomplaintimage,
                  text: "make complaint_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.setting_screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.settingimage,
                  text: "setting_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.support_screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.supportimage,
                  text: "support_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.referral_screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.referralimage,
                  text: "referral_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.voucher_screen);
                },
                child: CustomImageWithTextRow(
                  imageurl: AppImage.voucherlimage,
                  text: "voucher_drawer".tr,
                ),
              ),
              AddVerticalSpace(25),
              InkWell(
                onTap: () {},
                child: CustomImageWithTextRow(
                  imageurl: AppImage.signoutimage,
                  text: "sign_out_drawer".tr,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          googleMap(),
          Obx(() => homeController.isLoad.value
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.0), // S
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ), // emi-transparent overlay
                  ),
                )
              : SizedBox()),
          Positioned(
            top: 25.h,
            left: 10.w,
            right: 10.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: Image.asset(
                    AppImage.drawerimage,
                    height: 35.h,
                  ),
                ),
                Text(
                  "home".tr,
                  style: Black20,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(RouteName.profile_Screen);
                  },
                  child: CircleAvatar(
                    maxRadius: 20.sp,
                    backgroundColor: AppColor.primaryBlueColor,
                  ),
                )
              ],
            ),
          ),
          // !homeController.iscurrentLocationMarker.value?
          HomeScreenBottomContent()
          // : SizedBox(),
        ],
      ),
    );
  }

}
