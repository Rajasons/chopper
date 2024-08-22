import 'package:get/get.dart';

class HistoryController extends GetxController{

  static HistoryController get instant => Get.find();

  RxInt switcherIndex = 0.obs;

}