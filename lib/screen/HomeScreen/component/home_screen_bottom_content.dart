import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:taxiuser/constant/color.dart';
import 'package:taxiuser/view_model/HomeController/home_controller.dart';
import 'package:taxiuser/widget/custom_button.dart';
import '../../../constant/image.dart';
import '../../../constant/textstyle.dart';
import '../../../utils/constant.dart';
import '../../../widget/custom_icon_with_text_column.dart';
import '../../../widget/custom_text_field.dart';

class HomeScreenBottomContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final homecontroller = HomeController.instant;

    // void _homescreenlScreenBottomSheet(BuildContext context, Widget? image, String? title, String? description) {
    //   showModalBottomSheet(
    //     context: context,
    //     isScrollControlled: true,
    //     builder: (BuildContext context) {
    //       return  Container(
    //         padding: EdgeInsets.symmetric(horizontal: 25.w),
    //         child: homecontroller.vehicleType.value == 4 ?
    //         Column(
    //           mainAxisSize: MainAxisSize.max,
    //           children: [
    //             AddVerticalSpace(25),
    //             CustomTextField(
    //               onTap: () {
    //                 homecontroller.isActive.value = true;
    //               },
    //               prefixIcon: Icon(Icons.search),
    //               onChanged: (value) {
    //                 homecontroller.isActive.value = true;
    //                 homecontroller.getSuggestions(
    //                     homecontroller.searchFromController);
    //                 if (homecontroller
    //                     .searchFromController.text.isEmpty) {
    //                   homecontroller.suggestions_data.clear();
    //                 }
    //               },
    //               controller: homecontroller.searchFromController,
    //               hinttext: "from_home".tr,
    //               readonly: false,
    //             ),
    //             AddVerticalSpace(10),
    //             CustomTextField(
    //               onTap: () {
    //                 homecontroller.isActive.value = false;
    //                 if (homecontroller
    //                     .searchFromController.text.isEmpty) {
    //                   homecontroller.searchFromController.text =
    //                       homecontroller.fromaddress.value;
    //                 }
    //               },
    //               prefixIcon: Icon(Icons.search),
    //               controller: homecontroller.searchToController,
    //               onChanged: (value) {
    //                 homecontroller.isActive.value = false;
    //                 homecontroller.getSuggestions(
    //                     homecontroller.searchToController);
    //                 if (homecontroller
    //                     .searchToController.text.isEmpty) {
    //                   homecontroller.suggestions_data.clear();
    //                 }
    //               },
    //               hinttext: "to".tr,
    //               readonly: false,
    //             ),
    //             SizedBox(height: 20),
    //             Obx(
    //                   () => homecontroller.suggestions_data.isEmpty
    //                   ? Text("")
    //                   : Expanded(
    //                 child: ListView.builder(
    //                   itemCount: homecontroller
    //                       .suggestions_data.length,
    //                   itemBuilder: (context, index) {
    //                     return Padding(
    //                       padding: EdgeInsets.symmetric(
    //                           vertical: 2.h),
    //                       child: InkWell(
    //                         onTap: () async {
    //                           homecontroller.onItemSelected(
    //                               homecontroller
    //                                   .suggestions_data[index]);
    //                           // homecontroller.isActive.value == false ? homecontroller
    //                           //             .searchToController.text =
    //                           //         homecontroller
    //                           //             .suggestions_data[index]
    //                           //     : homecontroller
    //                           //             .searchFromController
    //                           //             .text =
    //                           //         homecontroller
    //                           //             .suggestions_data[index];
    //                           //
    //                           // if (!homecontroller.isActive.value) {
    //                           //   homecontroller.isConfirm.value = true;
    //                           //   Get.back();
    //                           // }
    //                           // homecontroller.fromaddress.value = homecontroller.searchFromController.text;
    //                         },
    //                         child: ListTile(
    //                           shape: RoundedRectangleBorder(
    //                               borderRadius:
    //                               BorderRadius.circular(
    //                                   10.sp)),
    //                           leading: Icon(Icons.location_on),
    //                           title: Text(
    //                             homecontroller
    //                                 .suggestions_data[index],
    //                             style: Black12,
    //                           ),
    //                           trailing: Text(
    //                             "Save",
    //                             style: Black11w200,
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ],) :
    //         homecontroller.vehicleType.value == 5 ?
    //         Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ListTile(
    //               leading: Text("Bike Icon"),
    //               title: Text("Bike Descriptio",),
    //               trailing: Text("Price"),
    //
    //             ),
    //             ListTile(
    //               leading: Text("Bike Icon"),
    //               title: Text("Bike Descriptio",),
    //               trailing: Text("Price"),
    //
    //             ),
    //             ListTile(
    //               leading: Text("Bike Icon"),
    //               title: Text("Bike Descriptio",),
    //               trailing: Text("Price"),
    //
    //             ),
    //             ListTile(
    //               leading: Text("Bike Icon"),
    //               title: Text("Bike Descriptio",),
    //               trailing: Text("Price"),
    //
    //             ),
    //             ListTile(
    //               leading: Text("Bike Icon"),
    //               title: Text("Bike Descriptio",),
    //               trailing: Text("Price"),
    //
    //             ),
    //           ],
    //         ) :
    //
    //         Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             AddVerticalSpace(20),
    //             if (image != null) image else SizedBox(),
    //             AddVerticalSpace(10),
    //             Text(
    //               title ?? "",
    //               style: Black18w800,
    //             ),
    //             AddVerticalSpace(10),
    //             Text(
    //               description ?? "",
    //               style: Black15,
    //             ),
    //             AddVerticalSpace(20),
    //             CustomButton(
    //               btnText: "close".tr,
    //               onPressed: () {
    //                 Get.back();
    //               },
    //               backColor: AppColor.primaryryellowcolor,
    //             ),
    //             AddVerticalSpace(20),
    //           ],
    //         ),
    //       );
    //     },
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    //     ),
    //     backgroundColor: Colors.white,
    //   ).whenComplete(() {
    //     homecontroller.isshowbottomcontent.value = true;
    //   },);
    // }

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Card(
        elevation: 10.sp,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.sp),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.sp),
              topRight: Radius.circular(40.sp),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddVerticalSpace(5),
              Text(
                "choose_a_ride_home".tr,
                style: Black14w600,
              ),
              AddVerticalSpace(10),
              Container(
                height: 70.h,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: InkWell(
                        onTap: () {
                          homecontroller.imagedetailindex.value = index;
                        },
                        child: Obx(
                              () =>
                              CustomIconWithTextColumn(
                                Icon: homecontroller.imagedetailindex.value ==
                                    index
                                    ? InkWell(
                                  onTap: () {
                                    homecontroller.bottonSheetIndex.value = 0;
                                  }, child: Icon(
                                  Icons.info_outline,
                                  color: AppColor.primaryryellowcolor,
                                  size: 24.h,
                                ),
                                )
                                    : null,
                                text: homecontroller.imageDetail[index]['text'],
                                backcolor:
                                homecontroller.imagedetailindex.value == index
                                    ? AppColor.primaryrlightyellowcolor
                                    : Colors.transparent,
                                imageurl: homecontroller.imageDetail[index]
                                ['imageUrl'],
                              ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Obx(
              //     () => Row(
              //       children: [
              //         InkWell(
              //           onTap: () {
              //             homecontroller.bottonSheetIndex.value = 0;
              //           },
              //           child: CustomIconWithTextColumn(
              //             Icon: homecontroller.bottonSheetIndex.value == 0
              //                 ? InkWell(
              //                     onTap: () {
              //                       // homecontroller.homescreenBottomSheet(context,
              //                       //     Image.asset(
              //                       //       AppImage.autoimage,
              //                       //       height: 50.h,
              //                       //     ),
              //                       //     "auto".tr,
              //                       //     "Easy,fast, and convenient way to ride around the city.door-to-door,pool autorickshaw service at your face".tr);
              //                     },
              //                     child: Icon(
              //                       Icons.info_outline,
              //                       color: AppColor.primaryryellowcolor,
              //                       size: 24.h,
              //                     ))
              //                 : SizedBox(),
              //             backcolor: homecontroller.vehicleType.value == 0
              //                 ? AppColor.primaryrlightyellowcolor
              //                 : Colors.transparent,
              //             imageurl: AppImage.autoimage,
              //             text: "auto".tr,
              //           ),
              //         ),
              //         AddHorizontalSpace(20),
              //         InkWell(
              //           onTap: () {
              //             homecontroller.vehicleType.value = 1;
              //           },
              //           child: CustomIconWithTextColumn(
              //             Icon: homecontroller.vehicleType.value == 1
              //                 ? InkWell(
              //                     onTap: () {
              //                       homecontroller.homescreenBottomSheet(
              //                           context,
              //                           Image.asset(
              //                             AppImage.moto1image,
              //                             height: 50.h,
              //                           ),
              //                           "moto".tr,
              //                           "Easy,fast, and convenient way to ride around the city.Avoid traffic jams or looking for parkings spots.Door-to-door moto services at your own price".tr);
              //                     },
              //                     child: Icon(
              //                       Icons.info_outline,
              //                       color: AppColor.primaryryellowcolor,
              //                       size: 24.h,
              //                     ),
              //                   )
              //                 : SizedBox(),
              //             backcolor: homecontroller.vehicleType.value == 1
              //                 ? AppColor.primaryrlightyellowcolor
              //                 : Colors.transparent,
              //             imageurl: AppImage.moto1image,
              //             text: "moto".tr,
              //           ),
              //         ),
              //         AddHorizontalSpace(20),
              //         InkWell(
              //           onTap: () {
              //             homecontroller.vehicleType.value = 2;
              //           },
              //           child: CustomIconWithTextColumn(
              //             Icon: homecontroller.vehicleType.value == 2
              //                 ? InkWell(
              //                     onTap: () {
              //                       homecontroller.homescreenBottomSheet(
              //                           context,
              //                           Image.asset(
              //                             AppImage.rideimage,
              //                             height: 50.h,
              //                           ),
              //                           "ride".tr,
              //                           "Here you offer your price and choose the driver by yourself.Save money and travel with comfort!".tr);
              //                     },
              //                     child: Icon(
              //                       Icons.info_outline,
              //                       color: AppColor.primaryryellowcolor,
              //                       size: 24.h,
              //                     ),
              //                   )
              //                 : SizedBox(),
              //             backcolor: homecontroller.vehicleType.value == 2
              //                 ? AppColor.primaryrlightyellowcolor
              //                 : Colors.transparent,
              //             imageurl: AppImage.rideimage,
              //             text: "ride".tr,
              //           ),
              //         ),
              //         AddHorizontalSpace(20),
              //         InkWell(
              //           onTap: () {
              //             homecontroller.vehicleType.value = 3;
              //           },
              //           child: CustomIconWithTextColumn(
              //             Icon: homecontroller.vehicleType.value == 3
              //                 ? InkWell(
              //                     onTap: () {
              //                       homecontroller.homescreenBottomSheet(
              //                           context,
              //                           Image.asset(
              //                             AppImage.citytocityimage,
              //                             height: 50.h,
              //                           ),
              //                           "city_to_city".tr,
              //                           "Comfortable rides to other cities at your price.Ride to other cities and surrounding areas.Set your date and time - no need to rely on bus timetables."
              //                               .tr);
              //                     },
              //                     child: Icon(
              //                       Icons.info_outline,
              //                       color: AppColor.primaryryellowcolor,
              //                       size: 24.h,
              //                     ),
              //                   )
              //                 : SizedBox(),
              //             backcolor: homecontroller.vehicleType.value == 3
              //                 ? AppColor.primaryrlightyellowcolor
              //                 : Colors.transparent,
              //             imageurl: AppImage.citytocityimage,
              //             text: "city_to_city".tr,
              //           ),
              //         ),
              //         AddHorizontalSpace(20),
              //         InkWell(
              //           onTap: () {
              //             homecontroller.vehicleType.value = 4;
              //           },
              //           child: CustomIconWithTextColumn(
              //             Icon: homecontroller.vehicleType.value == 4
              //                 ? InkWell(
              //                     onTap: () {
              //                       homecontroller.homescreenBottomSheet(
              //                           context,
              //                           Image.asset(
              //                             AppImage.deliveryimage,
              //                             height: 50.h,
              //                           ),
              //                           "delivery".tr,
              //                           "Experience easy, fast, and convenient delivery with our vehicle service. Perfect for navigating the city, our door-to-door delivery ensures your packages arrive promptly. Trust our reliable and efficient auto vehicle service to meet all your local delivery needs.");
              //                     },
              //                     child: Icon(
              //                       Icons.info_outline,
              //                       color: AppColor.primaryryellowcolor,
              //                       size: 24.h,
              //                     ),
              //                   )
              //                 : SizedBox(),
              //             backcolor: homecontroller.vehicleType.value == 4
              //                 ? AppColor.primaryrlightyellowcolor
              //                 : Colors.transparent,
              //             imageurl: AppImage.deliveryimage,
              //             text: "delivery_home".tr,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              AddVerticalSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImage.fromimage,
                    height: 18.h,
                    color: AppColor.primaryryellowcolor,
                  ),
                  AddHorizontalSpace(8),
                  Obx(
                        () =>
                        Expanded(
                          child: Text(
                            homecontroller.sourceaddress.value,
                            style: Black12,
                          ),
                        ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppColor.primarytextfieldbackcolor),
                      onPressed: () {},
                      child: Text(
                        "source".tr,
                        style: Black15w400,
                      ))
                ],
              ),
              AddVerticalSpace(20),
              CustomTextField(
                controller: homecontroller.searchToController,
                prefixIcon: Icon(Icons.search),
                onTap: () {
                  // if (homecontroller.searchFromController.text.isEmpty) {
                  //   homecontroller.searchFromController.text =
                  //       homecontroller.fromaddress.value;
                  // }
                  homecontroller.bottonSheetIndex.value = 1;
                },
                readonly: true,
                hinttext: "to".tr,
              ),
              AddVerticalSpace(20),
              Obx(() =>
                    Visibility(
                      visible: homecontroller.isConfirm.value,
                      child: Center(
                        child: CustomButton(
                          backColor: AppColor.primaryryellowcolor,
                          fontcolor: Colors.black,
                          btnText: "confirm_location".tr,
                          onPressed: () async {
                            homecontroller.isLoad.value = true;
                            homecontroller.iscurrentLocationMarker.value = true;
                            homecontroller.origin = (await locationFromAddress(homecontroller.sourceaddress.value));
                            homecontroller.destination =
                            await locationFromAddress(homecontroller.searchToController.text);
                            Future.delayed(
                              Duration(seconds: 2),
                                  () async {
                                    homecontroller.PolylineFormtoDestination(context,originLatitude: homecontroller.origin[0].latitude, originLongitude: homecontroller.origin[0].longitude, destinationLatitude: homecontroller.destination[0].latitude,destinationLongitude: homecontroller.destination[0].longitude);
                                    // homecontroller.addMarker(originLatitude: homecontroller.origin[0].latitude, originLongitude: homecontroller.origin[0].longitude,destinationLatitude: homecontroller.destination[0].latitude,destinationLongitude: homecontroller.destination[0].longitude);



                                // showModalBottomSheet(
                                //   context: context,
                                //   builder: (context) {
                                //     return Column(
                                //       children: [
                                //         FutureBuilder(
                                //           future: homecontroller.etaRequest(
                                //               origin[0].latitude,
                                //               origin[0].longitude,
                                //               destination[0].latitude,
                                //               destination[0].longitude),
                                //           builder: (context, snapshot) {
                                //             if(snapshot.hasData) {
                                //               return Expanded(
                                //                 child: ListView.builder(
                                //                   itemCount: snapshot.data!.data!.length,
                                //                   itemBuilder: (context, index) {
                                //                     return ListTile(
                                //                       leading: Container(
                                //                         width: 60.w,
                                //                         child: Image.network(
                                //                           snapshot.data!.data![index].vehicleIcon!,
                                //                           height: 20.h,fit: BoxFit.fitWidth,),
                                //                       ),
                                //                       title: Text(snapshot.data!.data![index].name!),
                                //                       subtitle: Text(snapshot.data!.data![index].time!.toString()),
                                //                       trailing: Text(snapshot.data!.data![index].total!.toString()),
                                //                     );
                                //                   },
                                //                 ),
                                //               );
                                //             }
                                //             else
                                //               {
                                //                  return Center(child: CircularProgressIndicator());
                                //               }
                                //           },
                                //         ),
                                //         CustomButton(btnText: "Find Driver", onPressed : (){}),
                                //       ],
                                //     );
                                //   },
                                // );
                                // List<Marker> formdestinationmarker = [
                                //   Marker(
                                //     markerId: MarkerId("origin"),
                                //     icon: await BitmapDescriptor.asset(
                                //         ImageConfiguration(size: Size(40, 80)),
                                //         AppImage.frommarkerimage),
                                //     position: LatLng(
                                //         origin[0].latitude, origin[0].longitude),
                                //     infoWindow: InfoWindow(
                                //         snippet: homecontroller.fromaddress.value,
                                //         title: homecontroller.fromaddress.value),
                                //   ),
                                //   Marker(
                                //     markerId: MarkerId("destination"),
                                //     icon: await BitmapDescriptor.asset(
                                //         ImageConfiguration(size: Size(40, 60)),
                                //         AppImage.destinationmarkerimage),
                                //     position: LatLng(destination[0].latitude,
                                //         destination[0].longitude),
                                //     infoWindow: InfoWindow(
                                //         snippet:
                                //             homecontroller.searchToController.text,
                                //         title:
                                //             homecontroller.searchToController.text),
                                //   ),
                                // ];
                                //
                                // if (homecontroller.iscurrentLocationMarker.value) {
                                //   homecontroller.marker.clear();
                                //   homecontroller.marker
                                //       .addAll(formdestinationmarker);
                                //   homecontroller.latlng.value = LatLng(
                                //       origin[0].latitude, origin[0].longitude);
                                //   homecontroller
                                //       .moveCamera(homecontroller.latlng.value);
                                //   homecontroller.isLoad.value = false;
                                // }
                              },
                            );

                          },
                        ),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
