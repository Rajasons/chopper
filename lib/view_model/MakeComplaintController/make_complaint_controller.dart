import 'package:get/get.dart';

class MakeComplaintController extends GetxController{

  List MakeComplaintlist = [
    "vehicle_not_clean".tr,
    "user_experience_concerns".tr,
    "payment_problems".tr
  ];

  RxInt complaintType = 0.obs;
  RxBool iscomplaint = false.obs;

}