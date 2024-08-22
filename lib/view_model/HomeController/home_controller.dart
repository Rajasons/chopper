import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:taxiuser/data/network.dart';
import 'package:http/http.dart' as http;
import 'package:taxiuser/data/url.dart';
import 'package:taxiuser/model/eta_request.dart';
import 'package:taxiuser/screen/HomeScreen/component/bottomsheet/search_source_and_destination.dart';
import 'package:taxiuser/screen/HomeScreen/component/bottomsheet/select_vehicale.dart';
import 'package:taxiuser/utils/constant.dart';
import 'package:taxiuser/view_model/ProfileController/profile_controller.dart';
import '../../constant/image.dart';
import '../../screen/HomeScreen/component/bottomsheet/image_detail.dart';
import '../../sharedpreference/shared_prefrences.dart';

class HomeController extends GetxController {

  static HomeController get instant => Get.find();

  TextEditingController searchFromController = TextEditingController();
  TextEditingController searchToController = TextEditingController();
  RxString sourceaddress = "".obs;
  RxBool isConfirm = false.obs;
  RxBool isActive = false.obs;
  RxBool isLoad = false.obs;
  RxBool iscurrentLocation = false.obs;
  RxBool iscurrentLocationMarker = false.obs;
  RxList suggestions_data = <dynamic>[].obs;
  NetworkApi networkApi = NetworkApi();
  Rx<Completer<GoogleMapController>> mapcontroller = Completer<GoogleMapController>().obs;
  RxList<Marker> marker = <Marker>[].obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  List<Location> destination = <Location>[].obs;
  List<Location> origin = <Location>[].obs;
  Rx<LatLng> latlng = LatLng(21.124857, 73.112610).obs;
  RxList<Placemark> placemarks = <Placemark>[].obs;
  RxList<Polyline> polyline = <Polyline>[].obs;
  static EtaRequest? etarequest;
  RxInt imagedetailindex = 0.obs;
  RxInt selectvehicleforride = (-1).obs;
  RxInt bottonSheetIndex = (-1).obs;
  RxInt total = 0.obs;
  RxString zoneTypeId = "".obs;

  List<Widget> bottomSheetClass = [
    ImageDetail(),
    SearchSourceAndDestination(),
    SelectVehicale(),
  ];
  RxList<Map> imageDetail = [
    {
      "text": "auto".tr,
      "imageUrl": AppImage.autoimage,
      "bottomsheetimage": AppImage.autoimage,
      "vehicleName": "auto".tr,
      "description":
          "Easy,fast, and convenient way to ride around the city.door-to-door,pool autorickshaw service at your face"
              .tr,
    },
    {
      "text": "moto".tr,
      "imageUrl": AppImage.moto1image,
      "bottomsheetimage": AppImage.moto1image,
      "vehicleName": "moto".tr,
      "description":
          "Easy,fast, and convenient way to ride around the city.Avoid traffic jams or looking for parkings spots.Door-to-door moto services at your own price"
              .tr
    },
    {
      "text": "ride".tr,
      "imageUrl": AppImage.rideimage,
      "bottomsheetimage": AppImage.rideimage,
      "vehicleName": "ride".tr,
      "description":
          "Here you offer your price and choose the driver by yourself.Save money and travel with comfort!"
              .tr,
    },
    {
      "text": "city_to_city".tr,
      "imageUrl": AppImage.citytocityimage,
      "bottomsheetimage": AppImage.citytocityimage,
      "vehicleName": "city_to_city".tr,
      "description":
          "Comfortable rides to other cities at your price.Ride to other cities and surrounding areas.Set your date and time - no need to rely on bus timetables."
              .tr,
    },
    {
      "text": "delivery_home".tr,
      "imageUrl": AppImage.deliveryimage,
      "bottomsheetimage": AppImage.deliveryimage,
      "vehicleName": "delivery_home".tr,
      "description":
          "Comfortable rides to other cities at your price.Ride to other cities and surrounding areas.Set your date and time - no need to rely on bus timetables."
              .tr,
    },
  ].obs;


  // StreamSubscription<DatabaseEvent>? requestStreamStart;
  // StreamSubscription<DatabaseEvent>? requestStreamEnd;
  // StreamSubscription<DatabaseEvent>? rideStreamStart;
  // StreamSubscription<DatabaseEvent>? rideStreamUpdate;
  // bool userCancelled = false;

  // streamRequest() {
  //   requestStreamEnd?.cancel();
  //   requestStreamStart?.cancel();
  //   requestStreamStart = null;
  //   requestStreamEnd = null;
  //   var rideStreamUpdate = null;
  //   var rideStreamStart = null;
  //
  //   requestStreamStart = FirebaseDatabase.instance
  //       .ref('request-meta')
  //       .child(ProfileController.userProfileData.id.toString())
  //       .onChildRemoved
  //       .handleError((onError) {
  //     requestStreamStart?.cancel();
  //   }).listen((event) async {
  //     ismulitipleride = true;
  //     getUserDetails(id: userRequestData['id']);
  //     requestStreamEnd?.cancel();
  //     requestStreamStart?.cancel();
  //   });
  // }

  void bottomSheet(BuildContext context) {
      if (bottonSheetIndex.value >= 0 &&
          bottonSheetIndex.value < bottomSheetClass.length) {
        Get.bottomSheet(
          bottomSheetClass[bottonSheetIndex.value],
          backgroundColor: Colors.white,
          barrierColor: Colors.black.withOpacity(0.5),
          isScrollControlled: bottonSheetIndex.value == 1 ? true : false,

        ).whenComplete(
          () {
            Future.delayed(Duration(milliseconds: 200), () {
              bottonSheetIndex.value = -1;
            });
          },
        );
      }
    }

  Future<dynamic> getSuggestions(TextEditingController controller) async {final String googleApiKey = 'AIzaSyAMrhOkzn0kCKfb3SNlDfSMxWrKX-oropo';

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${controller.text}&key=${googleApiKey}&components=country:in'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['predictions'];
      suggestions_data.value =
          data.map((item) => item['description'].toString()).toList();
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  Future<EtaRequest> etaRequest(double origin_lat, double origin_lng, double destination_lat, double destination_lng) async {

    String token = await SharedPrefrencesServices.getBearerToken();
    try{
      var data = await networkApi.postApi(
        url: Url.etaRequest,
        header: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(
          {
            "pick_lat": origin_lat,
            "pick_lng": origin_lng,
            "drop_lat": destination_lat,
            "drop_lng": destination_lng,
            "ride_type": 1,
            "transport_type": "taxi"
          },
        ),
      );
      print("${data["success"]}***********************");
      etarequest = EtaRequest.fromJson(data);
      print("${etarequest!.success}******************");
    }catch(e,stackTrace){
      print("333333333333333333333333333333333333333333${e}");
      print("333333333333333333333333333333333333333333${stackTrace}");
    }

    return etarequest!;
  }

  Future<void> createRequest() async {
    isLoad.value = true;
    String token = await SharedPrefrencesServices.getBearerToken();
    DateTime now = DateTime.now();
    String formattedDate = "${now.year.toString().padLeft(4, '0')}-"
        "${now.month.toString().padLeft(2, '0')}-"
        "${now.day.toString().padLeft(2, '0')} "
        "${now.hour.toString().padLeft(2, '0')}:"
        "${now.minute.toString().padLeft(2, '0')}:"
        "${now.second.toString().padLeft(2, '0')}";

    Map data1 = {
      "pick_lat": origin[0].latitude,
      "pick_lng": origin[0].longitude,
      "drop_lat": destination[0].latitude,
      "drop_lng": destination[0].longitude,
      "vehicle_type": zoneTypeId.value,
      "ride_type": "1",
      "payment_opt": "0",
      "pick_address": sourceaddress.value,
      "drop_address": searchToController.text,
      "promocode_id": 0,
      "request_eta_amount": total.value,
      "is_later": true,
      "trip_start_time": formattedDate
    };
    print("dat11 ====================${data1}");

    StreamSubscription<DatabaseEvent>? rideStreamStart;
    StreamSubscription<DatabaseEvent>? rideStreamUpdate;
    StreamSubscription<DatabaseEvent>? requestStreamStart;
    StreamSubscription<DatabaseEvent>? requestStreamEnd;


    var data = await networkApi.postApi(
      url: Url.createRequest,
      header: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(
        {
          "pick_lat": origin[0].latitude,
          "pick_lng": origin[0].longitude,
          "drop_lat": destination[0].latitude,
          "drop_lng": destination[0].longitude,
          "vehicle_type": zoneTypeId.value,
          "ride_type": "1",
          "payment_opt": "0",
          "pick_address": sourceaddress.value,
          "drop_address": searchToController.text,
          "request_eta_amount": total.value,
          "stops":"[21.269190,72.958649]",
          "is_luggage_available":true,
          "is_pet_available":true
          // "is_later": true,
          // "trip_start_time": formattedDate,
        },
      ),
    ).then(
      (value) {
        print("${value}******************************************");
        streamRequest() {
          requestStreamEnd?.cancel();
          requestStreamStart?.cancel();
          rideStreamUpdate?.cancel();
          rideStreamStart?.cancel();
          requestStreamStart = null;
          requestStreamEnd = null;
          rideStreamUpdate = null;
          rideStreamStart = null;

          requestStreamStart = FirebaseDatabase.instance
              .ref('request-meta')
              .child(value['data']['id'])
              .onChildRemoved
              .handleError((onError) {
            requestStreamStart?.cancel();
          }).listen((event) async {
            // ismulitipleride = true;
            // getUserDetails(id: userRequestData['id']);
            requestStreamEnd?.cancel();
            requestStreamStart?.cancel();
          });
        }
        streamRequest();
        isLoad.value = false;
      },
    );
  }

  Future<void> onItemSelected(String selectedItem) async {
    if (isActive.value) {
      searchFromController.text = selectedItem;
    } else {
      searchToController.text = selectedItem;
      isConfirm.value = true;
      if(Get.isBottomSheetOpen!){
        Get.back();
      }
    }
    sourceaddress.value = searchFromController.text;
    print("${sourceaddress.value}22222222222222222222222222222");
    // List<Location> origin = await locationFromAddress(fromaddress.value);
    // LatLng originlatlng = LatLng(origin[0].latitude, origin[0].longitude);
    // moveCamera(originlatlng);
  }

  Future<void> moveCamera(LatLng targetPosition) async {
    final GoogleMapController controller = await mapcontroller.value.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          tilt: 30.0,
          target: targetPosition,
          zoom: 14,
        ),
      ),
    );
  }

  Future checkPermission(BuildContext context) async {

    isLoad.value = true;
    var position;

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        await Geolocator.openLocationSettings();
      }
      if (permission == LocationPermission.deniedForever) {
        await Geolocator.openLocationSettings();
      }
    }

    Timer.periodic(
      Duration(seconds: 2),
      (timer) async {
        if (iscurrentLocation.value == false) {
          try {
            bool isenable = await Geolocator.isLocationServiceEnabled();
            if (isenable == true) {
              position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);
              placemarks.value = await placemarkFromCoordinates(position.latitude, position.longitude);
              print(position.latitude);
              print(position.longitude);
              sourceaddress.value =
                  "${placemarks.first.street} ${placemarks.first.locality} ${placemarks.first.postalCode} ${placemarks.first.country}";
              latlng.value = LatLng(position.latitude, position.longitude);
              moveCamera(latlng.value);
              marker.add(Marker(
                  markerId: MarkerId("1"),
                  position: LatLng(position.latitude, position.longitude),
                  icon: await BitmapDescriptor.asset(
                      ImageConfiguration(), "assets/images/markericon.png")));
              iscurrentLocation.value = true;
            } else {
              print("Permision denied");
            }
          } catch (e) {
            print(e);
          }
          isLoad.value = false;
        }
      },
    );
  }

  Future<void> PolylineFormtoDestination(BuildContext context,{required double originLatitude, required double originLongitude, required double destinationLatitude, required double destinationLongitude}) async {
      try{
        // Get Point For Polyline From PolylinePoints.....
        PolylinePoints polylinePoints = PolylinePoints();

        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(googleApiKey: "AIzaSyAMrhOkzn0kCKfb3SNlDfSMxWrKX-oropo", request: PolylineRequest(
          origin: PointLatLng(originLatitude, originLongitude),
          destination: PointLatLng(destinationLatitude, destinationLongitude),
          mode: TravelMode.driving,
          optimizeWaypoints: true,
        ),);

        // Draw Polyline between Source And Destination...
        List<PointLatLng> points = result.points;
        List<LatLng> polylineCoordinates = points.map((point) {
          return LatLng(point.latitude, point.longitude);
        }).toList();
        polyline.clear();
        polyline.add(Polyline(
          polylineId: PolylineId("polyline"),
          width: 2,
          visible: true,
          points: polylineCoordinates,
        ));

        // Add Marker At Source And Deatination ....
        List<Marker> formdestinationmarker = [
          Marker(
            markerId: MarkerId("origin"),
            icon: await BitmapDescriptor.asset(
                ImageConfiguration(size: Size(40, 80)), AppImage.frommarkerimage),
            position: LatLng(originLatitude, originLongitude),
            infoWindow: InfoWindow(
                snippet: sourceaddress.value, title: sourceaddress.value),
          ),
          Marker(
            markerId: MarkerId("destination"),
            icon: await BitmapDescriptor.asset(
                ImageConfiguration(size: Size(40, 60)),
                AppImage.destinationmarkerimage),
            position: LatLng(destinationLatitude, destinationLongitude),
            infoWindow: InfoWindow(
                snippet: searchToController.text, title: searchToController.text),
          ),
        ];
        if (iscurrentLocationMarker.value) {
          marker.clear();
          marker.addAll(formdestinationmarker);
          latlng.value = LatLng(originLatitude, originLongitude);
          moveCamera(latlng.value);
          isLoad.value = false;
          bottonSheetIndex.value = 2;
        }
      }catch(exception){
        ErrorToast(Title: "error".tr, Message: "${exception.toString()}".tr, context: context);
      }

  }


// Future<void> addMarker({required double originLatitude, required double originLongitude, required double destinationLatitude, required double destinationLongitude}) async {
//   List<Marker> formdestinationmarker = [
//     Marker(
//       markerId: MarkerId("origin"),
//       icon: await BitmapDescriptor.asset(
//           ImageConfiguration(size: Size(40, 80)), AppImage.frommarkerimage),
//       position: LatLng(originLatitude, originLongitude),
//       infoWindow: InfoWindow(
//           snippet: sourceaddress.value, title: sourceaddress.value),
//     ),
//     Marker(
//       markerId: MarkerId("destination"),
//       icon: await BitmapDescriptor.asset(
//           ImageConfiguration(size: Size(40, 60)),
//           AppImage.destinationmarkerimage),
//       position: LatLng(destinationLatitude, destinationLongitude),
//       infoWindow: InfoWindow(
//           snippet: searchToController.text, title: searchToController.text),
//     ),
//   ];
//
//   if (iscurrentLocationMarker.value) {
//     marker.clear();
//     marker.addAll(formdestinationmarker);
//     latlng.value = LatLng(originLatitude, originLongitude);
//     moveCamera(latlng.value);
//     isLoad.value = false;
//   }
//


}


// Future<void> getDirections(List<Location> origin,List<Location >destination) async {
//
//   List<LatLng> decodePolyline(String encoded) {
//     List<LatLng> polyline = [];
//     int index = 0;
//     int len = encoded.length;
//     int lat = 0;
//     int lng = 0;
//
//     while (index < len) {
//       int b;
//       int shift = 0;
//       int result = 0;
//       do {
//         b = encoded.codeUnitAt(index++) - 63;
//         result |= (b & 0x1f) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//       lat += dlat;
//       shift = 0;
//       result = 0;
//       do {
//         b = encoded.codeUnitAt(index++) - 63;
//         result |= (b & 0x1f) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//       lng += dlng;
//       polyline.add(LatLng(
//         (lat / 1E5),
//         (lng / 1E5),
//       ),);
//     }
//     return polyline;
//   }
//
//   final response = await http.get(
//     Uri.parse(
//         'https://maps.googleapis.com/maps/api/directions/json?origin=${origin[0].latitude},${origin[0].longitude}&destination=${destination[0].latitude},${destination[0].longitude}&key=AIzaSyAMrhOkzn0kCKfb3SNlDfSMxWrKX-oropo'),
//   );
//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     final route = data['routes'][0]['overview_polyline']['points'];
//     final points = decodePolyline(route);
//     polyline.add(
//       Polyline(
//         polylineId: PolylineId('route'),
//         points: points,
//         color: Colors.black,
//         width: 3,
//       ),
//     );
//   } else {
//     throw Exception('Failed to load directions');
//   }
// }
// void homescreenBottomSheet(BuildContext context, Widget? image, String? title, String? description) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: EdgeInsets.symmetric(horizontal: 25.w),
//         child: vehicleType.value == 4 ? Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   AddVerticalSpace(25),
//                   CustomTextField(
//                     onTap: () {
//                       isActive.value = true;
//                     },
//                     prefixIcon: Icon(Icons.search),
//                     onChanged: (value) {
//                       isActive.value = true;
//                       getSuggestions(searchFromController);
//                       if (searchFromController.text.isEmpty) {
//                         suggestions_data.clear();
//                       }
//                     },
//                     controller: searchFromController,
//                     hinttext: "from_home".tr,
//                     readonly: false,
//                   ),
//                   AddVerticalSpace(10),
//                   CustomTextField(
//                     onTap: () {
//                       isActive.value = false;
//                       if (searchFromController.text.isEmpty) {
//                         searchFromController.text = fromaddress.value;
//                       }
//                     },
//                     prefixIcon: Icon(Icons.search),
//                     controller: searchToController,
//                     onChanged: (value) {
//                       isActive.value = false;
//                       getSuggestions(searchToController);
//                       if (searchToController.text.isEmpty) {
//                         suggestions_data.clear();
//                       }
//                     },
//                     hinttext: "to".tr,
//                     readonly: false,
//                   ),
//                   SizedBox(height: 20),
//                   Obx(
//                     () => suggestions_data.isEmpty
//                         ? Text("")
//                         : Expanded(
//                             child: ListView.builder(
//                               itemCount: suggestions_data.length,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(vertical: 2.h),
//                                   child: InkWell(
//                                     onTap: () async {
//                                       onItemSelected(suggestions_data[index]);
//                                       // homecontroller.isActive.value == false ? homecontroller
//                                       //             .searchToController.text =
//                                       //         homecontroller
//                                       //             .suggestions_data[index]
//                                       //     : homecontroller
//                                       //             .searchFromController
//                                       //             .text =
//                                       //         homecontroller
//                                       //             .suggestions_data[index];
//                                       //
//                                       // if (!homecontroller.isActive.value) {
//                                       //   homecontroller.isConfirm.value = true;
//                                       //   Get.back();
//                                       // }
//                                       // homecontroller.fromaddress.value = homecontroller.searchFromController.text;
//                                     },
//                                     child: ListTile(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.sp)),
//                                       leading: Icon(Icons.location_on),
//                                       title: Text(
//                                         suggestions_data[index],
//                                         style: Black12,
//                                       ),
//                                       trailing: Text(
//                                         "Save",
//                                         style: Black11w200,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                   ),
//                 ],
//               ) :
//         Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AddVerticalSpace(20),
//                       if (image != null) image else SizedBox(),
//                       AddVerticalSpace(10),
//                       Text(
//                         title ?? "",
//                         style: Black18w800,
//                       ),
//                       AddVerticalSpace(10),
//                       Text(
//                         description ?? "",
//                         style: Black15,
//                       ),
//                       AddVerticalSpace(20),
//                       CustomButton(
//                         btnText: "close".tr,
//                         onPressed: () {
//                           Get.back();
//                         },
//                         backColor: AppColor.primaryryellowcolor,
//                       ),
//                       AddVerticalSpace(20),
//                     ],
//                   ),
//       );
//     },
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
//     ),
//     backgroundColor: Colors.white,
//   );
// }
