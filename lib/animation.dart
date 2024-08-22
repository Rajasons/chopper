// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:taxiuser/utils/constant.dart';
//
// class Place extends StatefulWidget {
//   const Place({super.key});
//
//   @override
//   State<Place> createState() => _PlaceState();
// }
//
// class _PlaceState extends State<Place> {
//
//   // final TextEditingController _controller = TextEditingController();
//   // final String googleApiKey = 'AIzaSyAMrhOkzn0kCKfb3SNlDfSMxWrKX-oropo';
//   // List<String> _suggestions = [];
//   //
//   // Future<void> getSuggestions() async {
//   //
//   //   final response = await http.get(
//   //     Uri.parse(
//   //         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${_controller.text}&key=$googleApiKey'),
//   //   );
//   //
//   //   print(response.statusCode);
//   //   var data = jsonDecode(response.body);
//   //   print(data);
//   //
//   //   if (response.statusCode == 200) {
//   //
//   //     final List<dynamic> data = json.decode(response.body)['predictions'];
//   //     _suggestions =
//   //         data.map((item) => item['description'].toString()).toList();
//   //
//   //     print(_suggestions[0]);
//   //   } else {
//   //     throw Exception('Failed to load suggestions');
//   //   }
//   // }
//
//   Future<void> checkPermission() async {
//     var permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         bool permission = await Geolocator.openLocationSettings();
//       }
//       if (permission == LocationPermission.deniedForever) {
//         bool permission = await Geolocator.openLocationSettings();
//       }
//
//       if (await Geolocator.isLocationServiceEnabled()) {
//         Position position = await Geolocator.getCurrentPosition(
//             desiredAccuracy: LocationAccuracy.high);
//         print(position.latitude);
//         print(position.longitude);
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     checkPermission();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("kjhjbkjb"),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DirectionsMap extends StatefulWidget {
  @override
  _DirectionsMapState createState() => _DirectionsMapState();
}

class _DirectionsMapState extends State<DirectionsMap> {

  GoogleMapController? _controller;
  Set<Polyline> _polylines = {};

  final LatLng _origin = LatLng(21.2318996, 72.9034523); // San Francisco
  final LatLng _destination = LatLng(21.2049822,72.8407885
  ); // Los Angeles

  @override
  void initState() {
    super.initState();
    _getDirections();
  }

  Future<void> _getDirections() async {

    final apiKey = 'YOUR_API_KEY_HERE'; // Replace with your API key
    final response = await http.get(
      Uri.parse('https://maps.googleapis.com/maps/api/directions/json?origin=${_origin.latitude},${_origin.longitude}&destination=${_destination.latitude},${_destination.longitude}&key=AIzaSyAMrhOkzn0kCKfb3SNlDfSMxWrKX-oropo'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final polyline = data['routes'][0]['overview_polyline']['points'];
      print("${polyline}pppppppppppppppppppppppppppppppppp");
     final points = decodePolyline(polyline);
      setState(() {
        _polylines.add(
          Polyline(
            polylineId: PolylineId('route'),
            points: points,
            color: Colors.black,
            width: 3,
          ),
        );
      });
    } else {
      throw Exception('Failed to load directions');
    }
  }

  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;
      polyline.add(LatLng(
        (lat / 1E5),
        (lng / 1E5),
      ));
    }
    return polyline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Directions Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _origin,
          zoom: 13,
        ),
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
