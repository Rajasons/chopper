import 'package:get/get.dart';

class IntroController extends GetxController{

  static IntroController get instant  => Get.find();

  RxInt intropageindex = 0.obs;
  RxBool introPageIndex = false.obs;


}