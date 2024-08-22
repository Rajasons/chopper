import 'package:get/get.dart';

class WalletController extends GetxController{

 static WalletController get instant => Get.find();
  RxBool isAddmoney = true.obs;

}