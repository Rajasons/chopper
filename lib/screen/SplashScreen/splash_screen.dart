import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:taxiuser/resources/routes/routename.dart';
import 'package:taxiuser/sharedpreference/shared_prefrences.dart';
import 'package:taxiuser/view_model/SplashController/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 7),
      () {
        splashController.platformCheck();
        splashController.startBackgroundConnectivityCheck();
        splashController.AllReadySelectedLanguage();
        SharedPrefrencesServices.checkIsIntroVisible().then(
          (value) {
            if (value) {
              SharedPrefrencesServices.getBearerToken().then(
                (value) {
                  if (value == "" || value.isEmpty){

                    Get.offAllNamed(RouteName.continuewithmobile_screen);

                  } else {
                    Get.offAllNamed(RouteName.home_Screen);
                  }
                },
              );
            } else {
              Get.offNamed(RouteName.language_change_Screen);
            }
          },
        );
      },
    );
  }

  // void _startBackgroundConnectivityCheck() {
  //
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
  //     var result = await Connectivity().checkConnectivity();
  //
  //     switch (result[0]) {
  //       case ConnectivityResult.wifi:
  //         splashController.connectionStatus.value = 'Connected to WiFi';
  //         break;
  //       case ConnectivityResult.mobile:
  //         splashController.connectionStatus.value = 'Connected to Mobile Network';
  //         break;
  //       case ConnectivityResult.none:
  //         Get.to(InternetExceptionScreen());
  //         splashController.connectionStatus.value = 'No Internet Connection';
  //         break;
  //       default:
  //         splashController.connectionStatus.value = 'Unknown Connection Status';
  //         break;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Lottie.asset(
            repeat: false, "assets/lottie/car splash.json", fit: BoxFit.cover),
      ),
    );
  }
}
