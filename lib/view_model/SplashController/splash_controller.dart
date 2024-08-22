import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:taxiuser/sharedpreference/shared_prefrences.dart';
import '../../language/app_translation.dart';
import '../../screen/InternetExceptionScreen/internet_exception_screen.dart';
import '../LanguageController/language_controller.dart';
import 'dart:io' show Platform;

class SplashController extends GetxController
{

  static SplashController get instant => Get.find();
  late Timer _timer;
  RxBool isLoad = false.obs;
  LanguageController languagecontroller = Get.put(LanguageController());
  SharedPrefrencesServices prefrencesServices  = SharedPrefrencesServices();
  RxString connectionStatus = 'Unknown'.obs;
  RxString  platform = "".obs;

  void platformCheck(){
    if(Platform.isAndroid){

        platform.value = "android";
    }
    else if(Platform.isIOS)
      {
        platform.value = "ios";
      }
  }

  void AllReadySelectedLanguage(){
     prefrencesServices.getselectedlanguage().then((value){
      languagecontroller.Selected_Language.fillRange(0, 8,false);
      languagecontroller.Selected_Language[value] = true;
      changeLanguage(languagecontroller.language[value]['language_code']);
      print(value);
      print( languagecontroller.Selected_Language);
    });

  }

  void startBackgroundConnectivityCheck() {

    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      var result = await Connectivity().checkConnectivity();

      switch (result[0]) {
        case ConnectivityResult.wifi:
          connectionStatus.value = 'Connected to WiFi';
          break;
        case ConnectivityResult.mobile:
         connectionStatus.value = 'Connected to Mobile Network';
          break;
        case ConnectivityResult.none:
          Get.to(InternetExceptionScreen());
          connectionStatus.value = 'No Internet Connection';
          break;
        default:
          connectionStatus.value = 'Unknown Connection Status';
          break;
      }
    });
  }
}