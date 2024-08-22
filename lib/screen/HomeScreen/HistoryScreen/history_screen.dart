import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/HistoryController/history_controller.dart';

import '../../../constant/image.dart';
import '../component/history_container.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with TickerProviderStateMixin {

  //final historyController = HistoryController.instant;
  HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4,   vsync: this);
    return Scaffold(
      appBar: customAppbar(
          text: "history_drawer".tr,
          iconcolor: Colors.black,
          textcolor: Colors.black,
          backcolor: Colors.white.withOpacity(0.0)),
      body: Column(
        children:  [
          Card(
            elevation: 5.sp,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                color: AppColor.primarytextfieldbackcolor,
              ),
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: AppColor.primaryryellowcolor,
                ),
                  dividerHeight: 0.0,

                  indicatorSize: TabBarIndicatorSize.tab,
                  automaticIndicatorColorAdjustment: true,
                  labelColor: Colors.black,
                  tabAlignment: TabAlignment.center,
                  onTap: (value){
                    historyController.switcherIndex.value = value;
                  },
                  tabs:[
                    Tab(child: Text("taxi".tr)),
                    Tab(child: Text("rental".tr)),
                    Tab(child: Text("delivery".tr)),
                    Tab(child: Text("out station".tr)),
                  ]
              ),
            ),
          ),


           SizedBox(height: 20),
            FutureBuilder(
              future: null ,
              builder: (context, snapshot) {
                if(snapshot.hasData)
                  {
                    if(historyController.switcherIndex.value == 0)
                      {
                        return HistoryContainer(
                          fromtxt: "mini park",
                          destinationtxt: "8946 Essex St. Sunnyside, In46321",
                          ruppestxt: "₹ 1,520",
                        );
                      }
                    else
                    {
                          return CircularProgressIndicator();
                    }
                  }else{
                  return  Center(child: Image.asset(AppImage.nodataimage),);
                }
              },
            ),
        ],
      ),
    );
  }
}
