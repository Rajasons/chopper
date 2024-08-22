import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/constant/textstyle.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/HomeController/home_controller.dart';
import 'package:taxiuser/widget/custom_button.dart';

class SelectVehicale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final homecontroller = HomeController.instant;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          Text(
            "You've saved upto 27 on your Bike Ride!",
            style: Black12,
          ),
          AddVerticalSpace(10),
          FutureBuilder(
            future: homecontroller.etaRequest(homecontroller.origin[0].latitude, homecontroller.origin[0].longitude, homecontroller.destination[0].latitude, homecontroller.destination[0].longitude),
            builder: (context, snapshot) {
              print("=============${snapshot.data}");
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Card(
                          child: ListTile(
                            onTap: (){
                              homecontroller.selectvehicleforride.value = index;
                              homecontroller.zoneTypeId.value = snapshot.data!.data![index].zoneTypeId!;
                              homecontroller.total.value = snapshot.data!.data![index].total!;
                            },
                            tileColor:
                                homecontroller.selectvehicleforride.value == index
                                    ? AppColor.primaryrlightyellowcolor
                                    : Colors.transparent,
                            leading: Container(
                              width: 60.w,
                              child: Image.network(
                                snapshot.data!.data![index].vehicleIcon!,
                                height: 20.h,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            title: Text(snapshot.data!.data![index].name!),
                            subtitle: Text(
                                snapshot.data!.data![index].time!.toString()),
                            trailing: Text(snapshot.data!.data![index].total!
                                .toString()),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 0,
                        width: Get.width,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              }
            },
          ),
          Obx(
            ()=> CustomButton(
              isload: homecontroller.isLoad.value,
              btnText: "find_driver".tr,
              onPressed: () {
                homecontroller.selectvehicleforride.value == -1 ?
                   WarningToast(Title: "warning".tr, Message: "please_select_vehicle_for_service".tr, context: context) : homecontroller.createEtarequest();
              },
            ),
          ),
        ],
      ),
    );
  }
}
