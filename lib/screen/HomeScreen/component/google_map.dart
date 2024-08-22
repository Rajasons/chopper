import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiuser/view_model/HomeController/home_controller.dart';

class googleMap extends StatefulWidget {
  @override
  State<googleMap> createState() => _googleMapState();
}

class _googleMapState extends State<googleMap> {

  final homescontroller = HomeController.instant;

  onMapCreated(GoogleMapController controller) {
    homescontroller.mapcontroller.value.complete(controller);
  }

  @override
  void initState() {
    homescontroller.checkPermission(context);
  }

  // Future<void> moveCamera() async {
  //   final GoogleMapController controller = await homescontroller.mapcontroller.value.future;
  //   controller.moveCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: homescontroller.latlng.value,
  //         zoom: 14,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GoogleMap(
        polylines: Set.of(homescontroller.polyline),
        zoomControlsEnabled: false,
        onCameraIdle: () async {
          if (!homescontroller.iscurrentLocationMarker.value) {
            homescontroller.placemarks.value = await placemarkFromCoordinates(
                homescontroller.latitude.value,
                homescontroller.longitude.value);
            homescontroller.sourceaddress.value =
            "${homescontroller.placemarks.first.name},${homescontroller.placemarks.first.thoroughfare},${homescontroller.placemarks.first.locality},${homescontroller.placemarks.first.administrativeArea},${homescontroller.placemarks.first.postalCode},${homescontroller.placemarks.first.country}";
            homescontroller.searchFromController.text =
                homescontroller.sourceaddress.value;
          }
        },
        onCameraMove: (position) async {
          if (!homescontroller.iscurrentLocationMarker.value) {

            homescontroller.latitude.value = position.target.latitude;
            homescontroller.longitude.value = position.target.longitude;
            homescontroller.marker.add(
              Marker(
                markerId: MarkerId("1"),
                position: position.target,
                icon: await BitmapDescriptor.asset(
                    ImageConfiguration(
                      size: Size(40, 80),
                    ),
                    "assets/images/markericon.png"),
              ),
            );

          }
        },
        onMapCreated: (controller) {
          onMapCreated(controller);
        },
        markers: Set.of(homescontroller.marker),
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: homescontroller.latlng.value, zoom: 25),
      ),
    );
  }
}
