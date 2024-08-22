import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/view_model/HomeController/home_controller.dart';
import '../../../../constant/textstyle.dart';
import '../../../../utils/constant.dart';
import '../../../../widget/custom_text_field.dart';

class SearchSourceAndDestination extends StatelessWidget {

  const SearchSourceAndDestination({super.key});

  @override
  Widget build(BuildContext context) {

    final homecontroller = HomeController.instant;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AddVerticalSpace(25),
          CustomTextField(
            controller: homecontroller.searchFromController,
            onTap: () {
              homecontroller.isActive.value = true;
            },
            prefixIcon: Icon(Icons.search),
            onChanged: (value) {

              homecontroller.isActive.value = true;

              homecontroller.getSuggestions(homecontroller.searchFromController);

              if (homecontroller.searchFromController.text.isEmpty) {
                homecontroller.suggestions_data.clear();
              }

            },

            hinttext: "from_home".tr,
            readonly: false,
          ),
          AddVerticalSpace(10),
          CustomTextField(
            prefixIcon: Icon(Icons.search),
            controller: homecontroller.searchToController,
            onTap: () {
              homecontroller.isActive.value = false;
              if (homecontroller.searchFromController.text.isEmpty) {
                homecontroller.searchFromController.text = homecontroller.sourceaddress.value;
              }
            },
            onChanged: (value) {
              homecontroller.isActive.value = false;
              homecontroller.getSuggestions(homecontroller.searchToController);
              if (homecontroller.searchToController.text.isEmpty) {
                homecontroller.suggestions_data.clear();
              }
            },
            hinttext: "to".tr,
            readonly: false,
          ),
          SizedBox(height: 20),
          Obx(
                () => homecontroller.suggestions_data.isEmpty
                ? Text("")
                : Expanded(
              child: ListView.builder(
                itemCount: homecontroller.suggestions_data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: InkWell(
                      onTap: () async {
                        homecontroller.onItemSelected(homecontroller.suggestions_data[index]);
                        // homecontroller.isActive.value == false ? homecontroller
                        //             .searchToController.text =
                        //         homecontroller
                        //             .suggestions_data[index]
                        //     : homecontroller
                        //             .searchFromController
                        //             .text =
                        //         homecontroller
                        //             .suggestions_data[index];
                        //
                        // if (!homecontroller.isActive.value) {
                        //   homecontroller.isConfirm.value = true;
                        //   Get.back();
                        // }
                        // homecontroller.fromaddress.value = homecontroller.searchFromController.text;
                      },
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp)),
                        leading: Icon(Icons.location_on),
                        title: Text(
                          homecontroller.suggestions_data[index],
                          style: Black12,
                        ),
                        trailing: Text(
                          "Save",
                          style: Black11w200,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
